import 'package:freezed_annotation/freezed_annotation.dart';

import 'day_schedule.dart';

part 'program_week.freezed.dart';

@freezed
class ProgramWeek({
  required String id,
  required String trainingProgramId,
  required int weekNumber,
  required int repetitionDuration,
  required DateTime startDate,
  required DateTime endDate,
  required DateTime createdAt,
  required DateTime updatedAt,
  @Default([]) List<DaySchedule>? daySchedules,
}) with _$ProgramWeek;
