import 'package:result_dart/result_dart.dart';

import '../entities.dart';

abstract interface class DayScheduleRepository {
  AsyncResult<DaySchedule> getDaySchedule(String id);
  AsyncResult<List<DaySchedule>> getDaySchedulesByWeek(String weekScheduleId);
  AsyncResult<Unit> saveDaySchedule(DaySchedule daySchedule);
  AsyncResult<Unit> updateDaySchedule(DaySchedule daySchedule);
  AsyncResult<Unit> deleteDaySchedule(String id);
}
