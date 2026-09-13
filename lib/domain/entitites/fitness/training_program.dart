import 'package:freezed_annotation/freezed_annotation.dart';

import 'program_week.dart';

part 'training_program.freezed.dart';

enum FitnessObjective { weightLoss, muscleGain, maintain }

@freezed
class TrainingProgram({
  required String id,
  required String fitnessProfileId,
  required String name,
  required String description,
  required int programDuration,
  required DateTime startDate,
  required DateTime createdAt,
  required DateTime updatedAt,
  @Default([]) List<ProgramWeek>? weeks,
}) with _$TrainingProgram;
