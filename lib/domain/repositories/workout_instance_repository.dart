import 'package:result_dart/result_dart.dart';

import '../entities.dart';

abstract interface class WorkoutInstanceRepository {
  AsyncResult<WorkoutInstance> getWorkoutInstance(String id);
  AsyncResult<List<WorkoutInstance>> getWorkoutInstancesByDaySchedule(
    String dayScheduleId,
  );
  AsyncResult<Unit> saveWorkoutInstance(WorkoutInstance instance);
  AsyncResult<Unit> updateWorkoutInstance(WorkoutInstance instance);
  AsyncResult<Unit> deleteWorkoutInstance(String id);
}
