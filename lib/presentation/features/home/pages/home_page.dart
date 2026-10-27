import 'package:ekafitz/core/theme/spacing.dart';
import 'package:ekafitz/domain/entities.dart' show User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

final class const HomePage({super.key}) extends ConsumerWidget {
  static String get routeName => 'home';
  static String get routePath => '/home';

  static Page route({required LocalKey key}) =>
      MaterialPage(key: key, child: HomePage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mockUser = User(
      fullName: 'Default',
      email: 'deafult@mail.com',
      birthDate: DateTime(2000),
      gender: .male,
      passwordHash: '',
      createdAt: DateTime(2023),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Ekafitz'), centerTitle: true),
      body: SafeArea(
        child: ListView(
          padding: AppSpacing.padding10,
          children: [_UserSection(mockUser)],
        ),
      ),
    );
  }
}

final class const _UserSection(this.user) extends StatelessWidget {
  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.fullName),
        subtitle: Text("Email: ${user.email}"),
        contentPadding: AppSpacing.cardPadding,
        leading: CircleAvatar(
          child: Icon(user.gender == .male ? Icons.male : Icons.female),
        ),
        trailing: Icon(
          Icons.person_outline_rounded,
          color: user.gender == .male ? Colors.blue : Colors.pink,
        ),
      ),
    );
  }
}
