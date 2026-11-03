import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:ekafitz/data/datasources/local/ekafitz_db.dart';
import 'package:ekafitz/domain/entitites/user.dart';
import 'package:uuid/uuid.dart';

abstract class UserMapper {
  static User mapFromTableData(UserTableData data) {
    return User(
      id: data.id,
      fullName: data.fullName,
      email: data.email,
      birthDate: data.birthDate ?? DateTime(2000),
      gender: data.gender,
      passwordHash: data.passwordHash,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }

  static UserTableCompanion toTableCompanion(User user) {
    if (user.id == null) log('new User ID created for ${user.fullName}');

    final id = user.id ?? Uuid().v4();

    return UserTableCompanion.insert(
      id: id,
      email: user.email,
      fullName: user.fullName,
      gender: user.gender,
      passwordHash: user.passwordHash,
      birthDate: Value(user.birthDate),
      createdAt: Value(user.createdAt),
      updatedAt: Value(DateTime.now()),
    );
  }
}
