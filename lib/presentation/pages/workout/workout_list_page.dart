import 'package:ekafitz/core/localizations/intl.dart';
import 'package:ekafitz/core/util/extensions.dart';
import 'package:ekafitz/domain/entities.dart' show Workout;
import 'package:ekafitz/domain/usecases.dart';
import 'package:ekafitz/presentation/pages/workout/workout_form_page.dart';
import 'package:ekafitz/presentation/providers/workout/workout_providers.dart';
import 'package:ekafitz/presentation/widgets/workout/workout_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';

class WorkoutListPage extends ConsumerWidget {
  const WorkoutListPage({super.key});

  static Route<void> route() =>
      MaterialPageRoute(builder: (context) => const WorkoutListPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intl = EkafitzDictionary.of(context)!;
    final colorScheme = context.colors;
    final textTheme = context.textTheme;

    final asyncWorkouts = ref.watch(allWorkoutsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(intl.home_workouts_title),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(WorkoutFormPage.route()),
        icon: const Icon(Icons.add),
        label: Text(intl.add_workout_button),
      ),
      body: asyncWorkouts.when(
        data: (workouts) {
          if (workouts.isEmpty) {
            return Center(
              child: Padding(
                padding: const .all(24),
                child: Column(
                  mainAxisSize: .min,
                  spacing: 16,
                  children: [
                    Icon(
                      Icons.fitness_center,
                      size: 48,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    Text(
                      intl.empty_workouts,
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
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              final workout = workouts[index];
              return WorkoutCard(
                workout: workout,
                onEdit: () => Navigator.of(
                  context,
                ).push(WorkoutFormPage.route(workout: workout)),
                onDelete: () => _confirmDelete(context, ref, workout),
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
                  intl.load_error_workouts,
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                ElevatedButton.icon(
                  onPressed: () => ref.invalidate(allWorkoutsProvider),
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
    Workout workout,
  ) async {
    final intl = EkafitzDictionary.of(context)!;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(intl.delete_button),
        content: Text(workout.name),
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

    await GetIt.I<DeleteWorkoutUseCase>()(id: workout.id);
    ref.invalidate(allWorkoutsProvider);
  }
}
