import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:ekafitz/data/datasources/local/ekafitz_db.dart';
import 'package:ekafitz/data/mappers/user_mapper.dart';
import 'package:ekafitz/domain/entitites/user.dart';
import 'package:ekafitz/domain/repositories.dart' show UserRepository;
import 'package:result_dart/result_dart.dart';

final class const LocalUserRepository(this._db) implements UserRepository {
  final EkafitzDatabase _db;

  @override
  AsyncResult<User> getUser() async {
    try {
      final result = await _db.select(_db.userTable).getSingle();

      final user = UserMapper.mapFromTableData(result);

      return user.toSuccess();
    } catch (e) {
      log(e.toString());
      return Exception('LocalUserRepository - getUser').toFailure();
    }
  }

  @override
  AsyncResult<Unit> saveUser(User user) async {
    try {
      final companion = UserMapper.toTableCompanion(user);
      await _db.userTable.insertOne(companion);

      return unit.toSuccess();
    } catch (e) {
      return Exception('LocalUserRepository - saveUser').toFailure();
    }
  }
}
