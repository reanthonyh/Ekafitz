import 'package:ekafitz/core/localizations/intl.dart';
import 'package:ekafitz/domain/entities.dart' show Workout, WorkoutEquipment;
import 'package:ekafitz/domain/usecases.dart';
import 'package:ekafitz/presentation/providers/workout/workout_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';

class WorkoutFormPage extends ConsumerStatefulWidget {
  const WorkoutFormPage({this.workout, super.key});

  final Workout? workout;

  static Route<void> route({Workout? workout}) =>
      MaterialPageRoute(builder: (context) => WorkoutFormPage(workout: workout));

  @override
  ConsumerState<WorkoutFormPage> createState() => _WorkoutFormPageState();
}

class _WorkoutFormPageState extends ConsumerState<WorkoutFormPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _setsController;
  late final TextEditingController _repsController;
  late final TextEditingController _weightController;

  WorkoutEquipment? _equipment;
  bool _isSaving = false;

  bool get _isEditing => widget.workout != null;

  @override
  void initState() {
    super.initState();

    final workout = widget.workout;

    _nameController = TextEditingController(text: workout?.name);
    _descriptionController = TextEditingController(text: workout?.description);
    _setsController = TextEditingController(
      text: workout?.sets.toString() ?? '3',
    );
    _repsController = TextEditingController(
      text: workout?.reps.toString() ?? '12',
    );
    _weightController = TextEditingController(
      text: workout?.weight?.toString() ?? '',
    );
    _equipment = workout?.equipment;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _setsController.dispose();
    _repsController.dispose();
    _weightController.dispose();
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

  String? _optionalDoubleValidator(String? value) {
    final intl = EkafitzDictionary.of(context)!;

    if (value == null || value.trim().isEmpty) return null;
    final parsed = double.tryParse(value.trim().replaceAll(',', '.'));
    if (parsed == null) return intl.invalid_number;
    if (parsed < 0) return intl.invalid_positive_number;
    return null;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final intl = EkafitzDictionary.of(context)!;
    setState(() => _isSaving = true);

    final now = DateTime.now();
    final workout = Workout(
      id: widget.workout?.id ?? 0,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      sets: int.parse(_setsController.text.trim()),
      reps: int.parse(_repsController.text.trim()),
      weight: _weightController.text.trim().isEmpty
          ? null
          : double.parse(_weightController.text.trim().replaceAll(',', '.')),
      equipment: _equipment,
      createdAt: widget.workout?.createdAt ?? now,
      updatedAt: now,
    );

    try {
      if (_isEditing) {
        await GetIt.I<UpdateWorkoutUseCase>()(workout: workout);
      } else {
        await GetIt.I<SaveWorkoutUseCase>()(workout: workout);
      }

      ref.invalidate(allWorkoutsProvider);
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSaving = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(intl.save_error)));
    }
  }

  String _equipmentLabel(EkafitzDictionary intl, WorkoutEquipment? equipment) {
    return switch (equipment) {
      WorkoutEquipment.dumbell => intl.equipment_dumbell,
      null => intl.none_label,
    };
  }

  @override
  Widget build(BuildContext context) {
    final intl = EkafitzDictionary.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditing ? intl.edit_workout_title : intl.new_workout_title,
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
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _setsController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: intl.sets_label,
                        border: const OutlineInputBorder(),
                      ),
                      validator: _positiveIntValidator,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _repsController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: intl.reps_label,
                        border: const OutlineInputBorder(),
                      ),
                      validator: _positiveIntValidator,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _weightController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: intl.weight_label,
                  border: const OutlineInputBorder(),
                ),
                validator: _optionalDoubleValidator,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<WorkoutEquipment?>(
                initialValue: _equipment,
                decoration: InputDecoration(
                  labelText: intl.equipment_label,
                  border: const OutlineInputBorder(),
                ),
                items: [
                  DropdownMenuItem<WorkoutEquipment?>(
                    value: null,
                    child: Text(intl.none_label),
                  ),
                  ...WorkoutEquipment.values.map(
                    (equipment) => DropdownMenuItem<WorkoutEquipment?>(
                      value: equipment,
                      child: Text(_equipmentLabel(intl, equipment)),
                    ),
                  ),
                ],
                onChanged: (value) => setState(() => _equipment = value),
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
