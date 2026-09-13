import 'package:freezed_annotation/freezed_annotation.dart';

import 'workout_instance.dart';

part 'day_schedule.freezed.dart';

@freezed
class DaySchedule({
  required String id,
  required String weekScheduleId,
  required String dayOfWeek,
  required DateTime createdAt,
  required DateTime updatedAt,
  @Default([]) List<WorkoutInstance>? workoutInstances,
}) with _$DaySchedule;