import 'package:result_dart/result_dart.dart';

import '../entities.dart';

abstract interface class WeekScheduleRepository {
  AsyncResult<WeekSchedule> getWeekSchedule(String id);
  AsyncResult<List<WeekSchedule>> getWeekSchedulesByTrainingProgram(
    String trainingProgramId,
  );
  AsyncResult<Unit> saveWeekSchedule(WeekSchedule week);
  AsyncResult<Unit> updateWeekSchedule(WeekSchedule week);
  AsyncResult<Unit> deleteWeekSchedule(String id);
}