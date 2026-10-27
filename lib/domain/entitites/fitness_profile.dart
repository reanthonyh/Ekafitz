import 'package:freezed_annotation/freezed_annotation.dart';

import 'fitness/training_program.dart';

part 'fitness_profile.freezed.dart';

enum BodySomatotype { mesomorph, ectomorph, endomorph }

@freezed
class const FitnessProfile({
  final String? id,
  required final String userId,
  required final int age,
  required final double height,
  required final double weight,
  required final BodySomatotype bodySomatotype,
  required final DateTime createdAt,
  final DateTime? updatedAt,
  @Default([]) final List<TrainingProgram>? trainingPrograms,
}) with _$FitnessProfile;
