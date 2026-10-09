import 'package:ekafitz/core/localizations/intl.dart';
import 'package:ekafitz/core/util/extensions.dart';
import 'package:ekafitz/domain/entities.dart' show TrainingProgram;
import 'package:material_ui/material_ui.dart';
import 'package:intl/intl.dart' show DateFormat;

class TrainingProgramCard extends StatelessWidget {
  const TrainingProgramCard({
    required this.program,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  final TrainingProgram program;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

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
                  child: const Icon(Icons.calendar_month),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    spacing: 4,
                    children: [
                      Text(
                        program.name,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: .w600,
                        ),
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                      if (program.description.isNotEmpty)
                        Text(
                          program.description,
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
                _InfoChip(
                  icon: Icons.timelapse,
                  label: '${program.programDuration} wks',
                ),
                _InfoChip(
                  icon: Icons.event,
                  label: DateFormat.yMMMd().format(program.startDate),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

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
