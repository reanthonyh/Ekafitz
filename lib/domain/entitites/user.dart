import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

enum Gender { male, female }

@freezed
class User({
  required final String id,
  required final String fullName,
  required final String email,
  required final DateTime birthDate,
  required final Gender gender,
  required final String passwordHash,
  required final DateTime createdAt,
  required final DateTime updatedAt,
}) with _$User;
