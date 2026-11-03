import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ekafitz/data/datasources/local/ekafitz_db.dart';
import 'package:ekafitz/data/mappers/training_program_mapper.dart';
import 'package:ekafitz/domain/entities.dart' show TrainingProgram;
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

  Future<int> insertTestTrainingProgram() async {
    final program = TrainingProgram(
      id: 'prog-001',
      fitnessProfileId: 'profile-001',
      name: 'Test Program',
      description: 'A test program description',
      programDuration: 8,
      startDate: DateTime.now(),
      createdAt: DateTime.now(),
    );
    final companion = TrainingProgramMapper.toTableCompanion(program);
    return db.into(db.trainingProgramTable).insert(companion);
  }

  tearDown(() async {
    await db.close();
  });

  group('Local Training Program Repo', () {
    test('saveTrainingProgram returns the new row id', () async {
      // Act
      final id = await insertTestTrainingProgram();

      // Assert
      expect(id, 1);
    });

    test('getTrainingProgram returns the saved program', () async {
      // Arrange
      await insertTestTrainingProgram();

      // Act
      final tableData = await (db.select(
        db.trainingProgramTable,
      )..where((table) => table.id.equals('prog-001'))).getSingle();
      final program = TrainingProgramMapper.mapFromTableData(tableData);

      // Assert
      expect(program.name, 'Test Program');
    });

    test(
      'getAllTrainingPrograms returns empty list when no programs',
      () async {
        // Act
        final result = await db.select(db.trainingProgramTable).get();

        // Assert
        expect(result.length, 0);
      },
    );

    test('getAllTrainingPrograms returns saved programs', () async {
      // Arrange
      await insertTestTrainingProgram();

      // Act
      final result = await db.select(db.trainingProgramTable).get();
      final programs = result
          .map(TrainingProgramMapper.mapFromTableData)
          .toList();

      // Assert
      expect(programs.length, 1);
      expect(programs.first.name, 'Test Program');
    });

    test('getTrainingProgramsByFitnessProfile filters correctly', () async {
      // Arrange
      await insertTestTrainingProgram();

      // Act
      final result = await (db.select(
        db.trainingProgramTable,
      )..where((table) => table.fitnessProfileId.equals('profile-001'))).get();
      final programs = result
          .map(TrainingProgramMapper.mapFromTableData)
          .toList();

      // Assert
      expect(programs.length, 1);
      expect(programs.first.name, 'Test Program');
    });

    test(
      'getTrainingProgramsByFitnessProfile returns empty when no match',
      () async {
        // Act
        final result =
            await (db.select(db.trainingProgramTable)..where(
                  (table) =>
                      table.fitnessProfileId.equals('non-existent-profile'),
                ))
                .get();

        // Assert
        expect(result.length, 0);
      },
    );

    test('updateTrainingProgram updates the program data', () async {
      // Arrange
      await insertTestTrainingProgram();

      // Act
      final updatedProgram = TrainingProgram(
        id: 'prog-001',
        fitnessProfileId: 'profile-001',
        name: 'Updated Program',
        description: 'Updated description',
        programDuration: 12,
        startDate: DateTime.now(),
        createdAt: DateTime.now(),
      );
      await (db.update(db.trainingProgramTable)
            ..where((table) => table.id.equals('prog-001')))
          .write(TrainingProgramMapper.toTableCompanion(updatedProgram));

      // Assert
      final tableData = await (db.select(
        db.trainingProgramTable,
      )..where((table) => table.id.equals('prog-001'))).getSingle();
      final program = TrainingProgramMapper.mapFromTableData(tableData);

      expect(program.name, 'Updated Program');
      expect(program.programDuration, 12);
    });

    test('deleteTrainingProgram removes the program', () async {
      // Arrange
      await insertTestTrainingProgram();

      // Act
      await (db.delete(
        db.trainingProgramTable,
      )..where((table) => table.id.equals('prog-001'))).go();

      // Assert
      final rows = await db.select(db.trainingProgramTable).get();
      expect(rows.length, 0);
    });
  });
}
