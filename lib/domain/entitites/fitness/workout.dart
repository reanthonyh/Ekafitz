import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';

enum WorkoutEquipment { dumbell }

@freezed
class const Workout({
  final int? id,
  required final String name,
  final String? description,
  final int? sets,
  final int? reps,
  final double? weight,
  final WorkoutEquipment? equipment,
  required final DateTime createdAt,
  final DateTime? updatedAt,
}) with _$Workout;
