import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ekafitz/data/datasources/local/ekafitz_db.dart';
import 'package:ekafitz/data/mappers/user_mapper.dart';
import 'package:ekafitz/domain/entities.dart' show Gender, User;
import 'package:flutter_test/flutter_test.dart';

void main() {
  late EkafitzDatabase db;

  setUp(() {
    db = EkafitzDatabase(
      DatabaseConnection(
        NativeDatabase.memory(),
        closeStreamsSynchronously: true,
      ),
    );
  });

  Future<int> insertTestUser() {
    final user = User(
      id: '000',
      fullName: 'Nombre Apellido',
      email: 'vacio@correo.com',
      birthDate: DateTime(2000),
      gender: Gender.male,
      passwordHash: '0001',
      createdAt: DateTime.now(),
    );
    return db.into(db.userTable).insert(UserMapper.toTableCompanion(user));
  }

  tearDown(() async {
    await db.close();
  });

  group('Local User Repo', () {
    test('saveUser returns the new row id', () async {
      // Act
      final id = await insertTestUser();

      // Assert
      expect(id, 1);
    });

    test('watchUserWithId emits the saved user', () async {
      // Arrange
      await insertTestUser();

      // Act
      final tableData = await db.watchUserWithId('000').first;
      final user = UserMapper.mapFromTableData(tableData);

      // Assert
      expect(user.fullName, 'Nombre Apellido');
    });

    test(
      'getUser returns the saved user as success using repository',
      () async {
        // Arrange
        await insertTestUser();

        // Act
        final tableData = await db.select(db.userTable).getSingle();
        final user = UserMapper.mapFromTableData(tableData);

        // Assert
        expect(user.fullName, 'Nombre Apellido');
      },
    );

    test('saveUser with unique email constraint', () async {
      // Arrange
      await insertTestUser();

      // Act & Assert
      expect(() => insertTestUser(), throwsA(isA<Exception>()));
    });
  });
}
