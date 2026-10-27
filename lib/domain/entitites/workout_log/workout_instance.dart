import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_instance.freezed.dart';

@freezed
class WorkoutInstance({
  required String id,
  required String dayScheduleId,
  required String workoutId,
  required int scheduledReps,
  required double scheduledWeight,
  required int completedReps,
  required double completedWeight,
  required DateTime createdAt,
  required DateTime updatedAt,
}) with _$WorkoutInstance;