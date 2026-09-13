import 'package:freezed_annotation/freezed_annotation.dart';

import 'fitness/training_program.dart';

part 'fitness_profile.freezed.dart';

enum BodySomatotype { mesomorph, ectomorph, endomorph }

@freezed
class FitnessProfile({
  required String id,
  required String userId,
  required int age,
  required double height,
  required double weight,
  required BodySomatotype bodySomatotype,
  required DateTime createdAt,
  required DateTime updatedAt,
  @Default([]) List<TrainingProgram>? trainingPrograms,
}) with _$FitnessProfile;
