import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:ekafitz/data/datasources/local/ekafitz_db.dart';
import 'package:ekafitz/domain/entitites/fitness/workout.dart';
import 'package:ekafitz/domain/repositories.dart' show WorkoutRepository;
import 'package:result_dart/result_dart.dart';

final class const LocalWorkoutRepository(this._db) implements WorkoutRepository {
  final EkafitzDatabase _db;

  @override
  AsyncResult<Workout> getWorkoutById({required int id}) async {
    try {
      final result = await (_db.select(
        _db.workoutTable,
      )..where((table) => table.id.equals(id))).getSingle();

      return _WorkoutMapper.mapFromTableData(result).toSuccess();
    } catch (e) {
      log(e.toString());
      return Exception('LocalWorkoutRepository - getWorkoutById').toFailure();
    }
  }

  @override
  AsyncResult<List<Workout>> getAllWorkouts() async {
    try {
      final result = await _db.select(_db.workoutTable).get();

      return result.map(_WorkoutMapper.mapFromTableData).toList().toSuccess();
    } catch (e) {
      log(e.toString());
      return Exception('LocalWorkoutRepository - getAllWorkouts').toFailure();
    }
  }

  @override
  AsyncResult<List<Workout>> queryWorkouts({
    String? name,
    String? description,
    WorkoutEquipment? equipment,
  }) async {
    try {
      final query = _db.select(_db.workoutTable);

      if (name != null && name.isNotEmpty) {
        query.where((table) => table.workoutName.contains(name));
      }
      if (description != null && description.isNotEmpty) {
        query.where((table) => table.description.contains(description));
      }
      if (equipment != null) {
        query.where((table) => table.equipment.equalsValue(equipment));
      }

      final result = await query.get();

      return result.map(_WorkoutMapper.mapFromTableData).toList().toSuccess();
    } catch (e) {
      log(e.toString());
      return Exception('LocalWorkoutRepository - queryWorkouts').toFailure();
    }
  }

  @override
  AsyncResult<Unit> saveWorkout(Workout workout) async {
    try {
      final companion = _WorkoutMapper.toTableCompanion(workout);
      await _db.workoutTable.insertOne(companion);

      return unit.toSuccess();
    } catch (e) {
      log(e.toString());
      return Exception('LocalWorkoutRepository - saveWorkout').toFailure();
    }
  }

  @override
  AsyncResult<Unit> updateWorkout(Workout workout) async {
    try {
      final companion = _WorkoutMapper.toTableCompanion(workout, withId: true);
      await (_db.update(
        _db.workoutTable,
      )..where((table) => table.id.equals(workout.id))).write(companion);

      return unit.toSuccess();
    } catch (e) {
      log(e.toString());
      return Exception('LocalWorkoutRepository - updateWorkout').toFailure();
    }
  }

  @override
  AsyncResult<Unit> deleteWorkout(int id) async {
    try {
      await (_db.delete(
        _db.workoutTable,
      )..where((table) => table.id.equals(id))).go();

      return unit.toSuccess();
    } catch (e) {
      log(e.toString());
      return Exception('LocalWorkoutRepository - deleteWorkout').toFailure();
    }
  }
}

abstract class _WorkoutMapper {
  static Workout mapFromTableData(WorkoutTableData data) {
    return Workout(
      id: data.id,
      name: data.workoutName,
      description: data.description,
      sets: data.sets,
      reps: data.reps,
      weight: data.weight,
      equipment: data.equipment,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt ?? data.createdAt,
    );
  }

  static WorkoutTableCompanion toTableCompanion(
    Workout workout, {
    bool withId = false,
  }) {
    return WorkoutTableCompanion(
      id: withId ? Value(workout.id) : const Value.absent(),
      workoutName: Value(workout.name),
      description: Value(workout.description),
      sets: Value(workout.sets),
      reps: Value(workout.reps),
      weight: Value(workout.weight ?? 0),
      equipment: Value(workout.equipment),
      createdAt: Value(workout.createdAt),
      updatedAt: Value(DateTime.now()),
    );
  }
}
