import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

enum Gender { male, female }

@freezed
class User({
  required final String id,
  required final String fullName,
  final String? email,
  required final DateTime birthDate,
  required final Gender gender,
}) with _$User;
