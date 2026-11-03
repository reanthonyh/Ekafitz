import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ekafitz/data/datasources/local/ekafitz_db.dart';
import 'package:ekafitz/data/mappers/workout_mapper.dart';
import 'package:ekafitz/domain/entities.dart' show Workout, WorkoutEquipment;
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

  Future<int> insertTestWorkout() async {
    final workout = Workout(
      name: 'Test Workout',
      description: 'A test workout description',
      sets: 3,
      reps: 10,
      weight: 50.0,
      equipment: WorkoutEquipment.dumbell,
      createdAt: DateTime.now(),
    );
    final companion = WorkoutMapper.toTableCompanion(workout);
    return db.into(db.workoutTable).insert(companion);
  }

  tearDown(() async {
    await db.close();
  });

  group('Local Workout Repo', () {
    test('saveWorkout returns the new row id', () async {
      // Act
      final id = await insertTestWorkout();

      // Assert
      expect(id, 1);
    });

    test('getWorkoutById returns the saved workout', () async {
      // Arrange
      await insertTestWorkout();

      // Act
      final tableData = await (db.select(
        db.workoutTable,
      )..where((table) => table.id.equals(1))).getSingle();
      final workout = WorkoutMapper.mapFromTableData(tableData);

      // Assert
      expect(workout.name, 'Test Workout');
    });

    test('getAllWorkouts returns empty list when no workouts', () async {
      // Act
      final result = await db.select(db.workoutTable).get();

      // Assert
      expect(result.length, 0);
    });

    test('getAllWorkouts returns saved workouts', () async {
      // Arrange
      await insertTestWorkout();

      // Act
      final result = await db.select(db.workoutTable).get();
      final workouts = result.map(WorkoutMapper.mapFromTableData).toList();

      // Assert
      expect(workouts.length, 1);
      expect(workouts.first.name, 'Test Workout');
    });

    test('queryWorkouts by name filters correctly', () async {
      // Arrange
      await insertTestWorkout();

      // Act
      final result = await (db.select(
        db.workoutTable,
      )..where((table) => table.workoutName.contains('Test Workout'))).get();
      final workouts = result.map(WorkoutMapper.mapFromTableData).toList();

      // Assert
      expect(workouts.length, 1);
      expect(workouts.first.name, 'Test Workout');
    });

    test('queryWorkouts returns empty when no match', () async {
      // Act
      final result = await (db.select(
        db.workoutTable,
      )..where((table) => table.workoutName.contains('Non Existent'))).get();

      // Assert
      expect(result.length, 0);
    });

    test('updateWorkout updates the workout data', () async {
      // Arrange
      await insertTestWorkout();

      // Act
      final updatedWorkout = Workout(
        id: 1,
        name: 'Updated Workout',
        description: 'Updated description',
        sets: 4,
        reps: 12,
        weight: 60.0,
        equipment: WorkoutEquipment.dumbell,
        createdAt: DateTime.now(),
      );
      await (db.update(db.workoutTable)..where((table) => table.id.equals(1)))
          .write(WorkoutMapper.toTableCompanion(updatedWorkout));

      // Assert
      final tableData = await (db.select(
        db.workoutTable,
      )..where((table) => table.id.equals(1))).getSingle();
      final workout = WorkoutMapper.mapFromTableData(tableData);

      expect(workout.name, 'Updated Workout');
      expect(workout.sets, 4);
    });

    test('deleteWorkout removes the workout', () async {
      // Arrange
      await insertTestWorkout();

      // Act
      await (db.delete(
        db.workoutTable,
      )..where((table) => table.id.equals(1))).go();

      // Assert
      final rows = await db.select(db.workoutTable).get();
      expect(rows.length, 0);
    });
  });
}
