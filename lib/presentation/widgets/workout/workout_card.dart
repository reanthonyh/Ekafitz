import 'package:ekafitz/core/localizations/intl.dart';
import 'package:ekafitz/core/util/extensions.dart';
import 'package:ekafitz/domain/entities.dart' show Workout, WorkoutEquipment;
import 'package:material_ui/material_ui.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    required this.workout,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  final Workout workout;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  String _equipmentLabel(EkafitzDictionary intl, WorkoutEquipment? equipment) {
    return switch (equipment) {
      WorkoutEquipment.dumbell => intl.equipment_dumbell,
      null => '',
    };
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textTheme = context.textTheme;
    final intl = EkafitzDictionary.of(context)!;

    return Card(
      margin: const .symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const .all(16),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 12,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: colorScheme.primaryContainer,
                  child: const Icon(Icons.fitness_center),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    spacing: 4,
                    children: [
                      Text(
                        workout.name,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: .w600,
                        ),
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                      if (workout.description != null &&
                          workout.description!.isNotEmpty)
                        Text(
                          workout.description!,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 2,
                          overflow: .ellipsis,
                        ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case 'edit':
                        onEdit();
                      case 'delete':
                        onDelete();
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text(intl.edit_button),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text(intl.delete_button),
                    ),
                  ],
                ),
              ],
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _StatChip(
                  icon: Icons.repeat,
                  label: '${workout.sets} x ${workout.reps}',
                ),
                if (workout.weight != null)
                  _StatChip(
                    icon: Icons.scale,
                    label: '${workout.weight} kg',
                  ),
                if (workout.equipment != null)
                  _StatChip(
                    icon: Icons.sports_gymnastics,
                    label: _equipmentLabel(intl, workout.equipment),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;

    return Container(
      padding: const .symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: .circular(999),
      ),
      child: Row(
        mainAxisSize: .min,
        spacing: 6,
        children: [
          Icon(icon, size: 16, color: colorScheme.onSecondaryContainer),
          Text(label, style: context.textTheme.labelMedium),
        ],
      ),
    );
  }
}
