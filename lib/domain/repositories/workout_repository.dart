import 'package:result_dart/result_dart.dart';

import '../entities.dart';

abstract interface class WorkoutRepository {
  AsyncResult<Workout> getWorkoutById({required int id});

  AsyncResult<List<Workout>> getAllWorkouts();

  // TODO: Replace with a WorkoutQueryRequest class
  AsyncResult<List<Workout>> queryWorkouts({
    String? name,
    String? description,
    WorkoutEquipment? equipment,
  });
}
