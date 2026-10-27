import 'package:freezed_annotation/freezed_annotation.dart';

import 'week_schedule.dart';

part 'training_program.freezed.dart';

enum FitnessObjective { weightLoss, muscleGain, maintain }

@freezed
class const TrainingProgram({
  final String? id,
  required final String fitnessProfileId,
  required final String name,
  final String? description,
  required final int programDuration,
  required final DateTime startDate,
  required final DateTime createdAt,
  final DateTime? updatedAt,
  @Default([]) final List<WeekSchedule>? weeks,
}) with _$TrainingProgram;
