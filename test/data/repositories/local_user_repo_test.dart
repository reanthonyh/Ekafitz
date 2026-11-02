import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ekafitz/data/datasources/local/ekafitz_db.dart';
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
    return db.saveUser(
      id: '000',
      fullName: "Nombre Apellido",
      email: 'vacio@correo.com',
      gender: .male,
      passwordHash: '0001',
    );
  }

  group("Local User Repo Test", () {
    test("Create a User Test", () async {
      final intID = await insertTestUser();

      expect(intID, 1);
    });

    test("Exist Users Test", () async {
      await insertTestUser(); // Arrange: the database starts empty

      final user = await db.watchUserWithId('000').first;

      expect(user.fullName, "Nombre Apellido");
    });
  });

  tearDown(() async {
    await db.close();
  });
}
