import 'package:freezed_annotation/freezed_annotation.dart';

import 'training_program.dart';

part 'fitness_profile.freezed.dart';

@freezed
class FitnessProfile({
  required String id,
  required String userIdOwner,
  required int age,
  required double height,
  required double weight,
  @Default([]) List<TrainingProgram>? trainingPrograms,
}) with _$FitnessProfile;
