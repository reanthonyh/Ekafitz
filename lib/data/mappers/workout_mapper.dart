import 'package:drift/drift.dart';
import 'package:ekafitz/data/datasources/local/ekafitz_db.dart';
import 'package:ekafitz/domain/entitites/fitness/workout.dart';

abstract class WorkoutMapper {
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

  static WorkoutTableCompanion toTableCompanion(Workout workout) {
    return WorkoutTableCompanion(
      id: workout.id != null ? Value(workout.id!) : const Value.absent(),
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
