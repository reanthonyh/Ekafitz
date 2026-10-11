import 'package:ekafitz/core/localizations/intl.dart';
import 'package:ekafitz/core/util/extensions.dart';
import 'package:ekafitz/domain/entities.dart' show User, Gender;
import 'package:material_ui/material_ui.dart';

final class const UserCardHeader(this.user, {super.key})
    extends StatelessWidget {
  final User user;

  int _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;

    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  @override
  Widget build(BuildContext context) {
    final intl = EkafitzDictionary.of(context)!;

    final colorScheme = context.colors;
    final textTheme = context.textTheme;

    return Card(
      margin: const .symmetric(horizontal: 16),
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const .all(20),
        child: Column(
          spacing: 16,
          crossAxisAlignment: .start,
          children: [
            Container(
              padding: const .symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: .circular(12),
                gradient: LinearGradient(
                  stops: [0.5, 1.0],
                  colors: [
                    colorScheme.primaryContainer,
                    switch (user.gender) {
                      .male => Colors.blue.shade900,
                      .female => Colors.pink.shade900,
                    },
                  ],
                ),
              ),
              child: Row(
                spacing: 16,
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: colorScheme.secondaryContainer,
                    child: const Icon(Icons.people, size: 48),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: 4,
                      children: [
                        Text(
                          user.fullName,
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: .w600,
                          ),
                          maxLines: 2,
                          overflow: .ellipsis,
                        ),
                        Text(
                          intl.email_label(user.email),
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          overflow: .ellipsis,
                        ),
                      ],
                    ),
                  ),

                  Icon(
                    switch (user.gender) {
                      Gender.male => Icons.male,
                      Gender.female => Icons.female,
                    },
                    size: 28,
                    color: switch (user.gender) {
                      Gender.male => Colors.blue.shade600,
                      Gender.female => Colors.pink.shade600,
                    },
                  ),
                ],
              ),
            ),

            const Divider(height: 24),

            Row(
              spacing: 18,
              children: [
                Text(
                  intl.age_label(_calculateAge(user.birthDate)),
                  style: textTheme.bodyLarge?.copyWith(fontWeight: .w500),
                ),

                Expanded(
                  child: Text(
                    intl.email_label(user.email),
                    style: textTheme.bodyMedium,
                    overflow: .ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
