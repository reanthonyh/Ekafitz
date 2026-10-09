import 'package:ekafitz/core/localizations/intl.dart';
import 'package:ekafitz/core/util/extensions.dart';
import 'package:ekafitz/domain/entities.dart' show TrainingProgram;
import 'package:ekafitz/domain/usecases.dart';
import 'package:ekafitz/presentation/pages/training_program/training_program_form_page.dart';
import 'package:ekafitz/presentation/providers/training_program/training_program_providers.dart';
import 'package:ekafitz/presentation/widgets/training_program/training_program_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';

class TrainingProgramListPage extends ConsumerWidget {
  const TrainingProgramListPage({super.key});

  static Route<void> route() =>
      MaterialPageRoute(builder: (context) => const TrainingProgramListPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = EkafitzDictionary.of(context)!;
    final colorScheme = context.colors;
    final textTheme = context.textTheme;

    final asyncPrograms = ref.watch(allTrainingProgramsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(intl.home_training_programs_title),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            Navigator.of(context).push(TrainingProgramFormPage.route()),
        icon: const Icon(Icons.add),
        label: Text(intl.add_training_program_button),
      ),
      body: asyncPrograms.when(
        data: (programs) {
          if (programs.isEmpty) {
            return Center(
              child: Padding(
                padding: const .all(24),
                child: Column(
                  mainAxisSize: .min,
                  spacing: 16,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 48,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    Text(
                      intl.empty_training_programs,
                      style: textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const .symmetric(vertical: 8),
            itemCount: programs.length,
            itemBuilder: (context, index) {
              final program = programs[index];
              return TrainingProgramCard(
                program: program,
                onEdit: () => Navigator.of(
                  context,
                ).push(TrainingProgramFormPage.route(program: program)),
                onDelete: () => _confirmDelete(context, ref, program),
              );
            },
          );
        },
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const .all(24),
            child: Column(
              mainAxisSize: .min,
              spacing: 16,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 48,
                  color: colorScheme.error,
                ),
                Text(
                  intl.load_error_training_programs,
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                ElevatedButton.icon(
                  onPressed: () => ref.invalidate(allTrainingProgramsProvider),
                  icon: const Icon(Icons.refresh),
                  label: Text(intl.retry_button),
                ),
              ],
            ),
          ),
        ),
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    TrainingProgram program,
  ) async {
    final intl = EkafitzDictionary.of(context)!;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(intl.delete_button),
        content: Text(program.name),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(intl.cancel_button),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(intl.delete_button),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    await GetIt.I<DeleteTrainingProgramUseCase>()(id: program.id);
    ref.invalidate(allTrainingProgramsProvider);
  }
}
