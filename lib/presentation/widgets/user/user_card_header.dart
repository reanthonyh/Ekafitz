import 'package:ekafitz/core/localizations/intl.dart';
import 'package:ekafitz/domain/entities.dart' show User, Gender;
import 'package:flutter/material.dart';

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

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return Card(
      margin: const .symmetric(horizontal: 4),
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const .all(12.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: .start,
          children: [
            Container(
              padding: const .symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: .circular(10),
                gradient: LinearGradient(
                  stops: [0.5, 1.0],
                  colors: [
                    colorScheme.primaryContainer,
                    switch (user.gender) {
                      .male => Colors.blue,
                      .female => Colors.pink,
                    }.withValues(alpha: 0.7),
                  ],
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    // TODO: Change the Icon to a network image once the User entity has avatarUrl
                    child: const Icon(Icons.people),
                    backgroundColor: colorScheme.secondaryContainer,
                  ),

                  Spacer(),

                  Icon(switch (user.gender) {
                    Gender.male => Icons.male,
                    Gender.female => Icons.female,
                  }, size: 25),
                ],
              ),
            ),
            Text(
              user.fullName,
              style: textTheme.headlineMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(intl.age_label(_calculateAge(user.birthDate))),
                VerticalDivider(),
                Expanded(
                  child: Text(
                    intl.email_label(user.email),
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
