import 'package:freezed_annotation/freezed_annotation.dart';

import 'program_week.dart';

part 'training_program.freezed.dart';

enum FitnessObjective { weightLoss, muscleGain, mantain }

@freezed
class TrainingProgram({
  required String id,
  required FitnessObjective objective,
  @Default([]) List<ProgramWeek>? weeks,
}) with _$TrainingProgram;
