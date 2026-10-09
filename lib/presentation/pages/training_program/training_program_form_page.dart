import 'package:ekafitz/core/localizations/intl.dart';
import 'package:ekafitz/core/util/constants.dart';
import 'package:ekafitz/domain/entities.dart' show TrainingProgram;
import 'package:ekafitz/domain/usecases.dart';
import 'package:ekafitz/presentation/providers/training_program/training_program_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:material_ui/material_ui.dart';

class TrainingProgramFormPage extends ConsumerStatefulWidget {
  const TrainingProgramFormPage({this.program, super.key});

  final TrainingProgram? program;

  static Route<void> route({TrainingProgram? program}) => MaterialPageRoute(
    builder: (context) => TrainingProgramFormPage(program: program),
  );

  @override
  ConsumerState<TrainingProgramFormPage> createState() =>
      _TrainingProgramFormPageState();
}

class _TrainingProgramFormPageState
    extends ConsumerState<TrainingProgramFormPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _fitnessProfileIdController;
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _programDurationController;

  late DateTime _startDate;
  bool _isSaving = false;

  bool get _isEditing => widget.program != null;

  @override
  void initState() {
    super.initState();

    final program = widget.program;

    _fitnessProfileIdController = TextEditingController(
      text: program?.fitnessProfileId ?? defaultFitnessProfileKey,
    );
    _nameController = TextEditingController(text: program?.name);
    _descriptionController = TextEditingController(text: program?.description);
    _programDurationController = TextEditingController(
      text: program?.programDuration.toString() ?? '4',
    );
    _startDate = program?.startDate ?? DateTime.now();
  }

  @override
  void dispose() {
    _fitnessProfileIdController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _programDurationController.dispose();
    super.dispose();
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return EkafitzDictionary.of(context)!.field_required;
    }
    return null;
  }

  String? _positiveIntValidator(String? value) {
    final intl = EkafitzDictionary.of(context)!;

    if (value == null || value.trim().isEmpty) {
      return intl.field_required;
    }
    final parsed = int.tryParse(value.trim());
    if (parsed == null) return intl.invalid_number;
    if (parsed <= 0) return intl.invalid_positive_number;
    return null;
  }

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() => _startDate = picked);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final intl = EkafitzDictionary.of(context)!;
    setState(() => _isSaving = true);

    final now = DateTime.now();
    final program = TrainingProgram(
      id: widget.program?.id ?? '',
      fitnessProfileId: _fitnessProfileIdController.text.trim(),
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      programDuration: int.parse(_programDurationController.text.trim()),
      startDate: _startDate,
      createdAt: widget.program?.createdAt ?? now,
      updatedAt: now,
      weeks: widget.program?.weeks,
    );

    try {
      if (_isEditing) {
        await GetIt.I<UpdateTrainingProgramUseCase>()(program);
      } else {
        await GetIt.I<SaveTrainingProgramUseCase>()(program);
      }

      ref.invalidate(allTrainingProgramsProvider);
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSaving = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(intl.save_error)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final intl = EkafitzDictionary.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditing
              ? intl.edit_training_program_title
              : intl.new_training_program_title,
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const .symmetric(horizontal: 20, vertical: 24),
            children: [
              TextFormField(
                controller: _fitnessProfileIdController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: intl.fitness_profile_id_label,
                  border: const OutlineInputBorder(),
                ),
                validator: _requiredValidator,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: intl.name_label,
                  border: const OutlineInputBorder(),
                ),
                validator: _requiredValidator,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                textInputAction: TextInputAction.next,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: intl.description_label,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _programDurationController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: intl.program_duration_label,
                  border: const OutlineInputBorder(),
                ),
                validator: _positiveIntValidator,
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: _pickStartDate,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: intl.start_date_label,
                    border: const OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(DateFormat.yMMMd().format(_startDate)),
                      const Icon(Icons.calendar_today, size: 18),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: _isSaving ? null : _save,
                icon: _isSaving
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                      )
                    : const Icon(Icons.save),
                label: Text(intl.save_button),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
