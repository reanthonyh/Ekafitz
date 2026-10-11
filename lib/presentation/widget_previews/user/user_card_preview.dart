import 'package:ekafitz/domain/entities.dart' show User;
import 'package:ekafitz/presentation/widget_previews/ekafitz_preview.dart';
import 'package:ekafitz/presentation/widgets/user/user_card_header.dart';
import 'package:material_ui/material_ui.dart';

@EkafitzPreview(
  name: "User Card",
  group: "User",
  size: Size(400, 250),
  brightness: .dark,
)
Widget userCardPreview() {
  final user = User(
    fullName: 'Anthony Hernandez',
    email: 'reanthony12@gmail.com',
    birthDate: DateTime(2000),
    gender: .male,
    passwordHash: '00291920',
    createdAt: DateTime(2022),
  );

  return UserCardHeader(user);
}
