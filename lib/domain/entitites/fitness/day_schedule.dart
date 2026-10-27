import 'package:freezed_annotation/freezed_annotation.dart';

import '../workout_log/workout_instance.dart';

part 'day_schedule.freezed.dart';

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

@freezed
class const DaySchedule({
  final String? id,
  required final String weekScheduleId,
  required final DayOfWeek dayOfWeek,
  required final DateTime createdAt,
  final DateTime? updatedAt,
  @Default([]) final List<WorkoutInstance>? workoutInstances,
}) with _$DaySchedule;
