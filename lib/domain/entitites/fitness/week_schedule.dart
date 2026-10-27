import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_schedule.freezed.dart';

@freezed
class const WeekSchedule({
  final String? id,
  required final String trainingProgramId,
  required final int weekNumber,
  required final int repetitionDuration,
  required final DateTime startDate,
  required final DateTime endDate,
  required final DateTime createdAt,
  final DateTime? updatedAt,
}) with _$WeekSchedule;
