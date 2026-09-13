import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';

enum WorkoutEquipment { dumbell }

@freezed
class Workout({
  required final int id,
  required final String name,
  final String? description,
  required final int sets,
  required final int reps,
  required final double? weight,
  required final WorkoutEquipment? equipment,
  required final DateTime createdAt,
  required final DateTime updatedAt,
}) with _$Workout;
