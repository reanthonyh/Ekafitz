import 'package:freezed_annotation/freezed_annotation.dart';

import 'program_week.dart';

part 'training_program.freezed.dart';

enum FitnessObjective { weightLoss, muscleGain, maintain }

@freezed
class TrainingProgram({
  required final String id,
  required final String fitnessProfileId,
  required final String name,
  required final String description,
  required final int programDuration,
  required final DateTime startDate,
  required final DateTime createdAt,
  required final DateTime updatedAt,
  @Default([]) final List<ProgramWeek>? weeks,
}) with _$TrainingProgram;
