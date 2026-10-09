import 'package:ekafitz/domain/entities.dart' show Workout;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const SaveWorkoutUseCase({required this._repository}) {
  final WorkoutRepository _repository;

  Future<void> call({required Workout workout}) =>
      _repository.saveWorkout(workout).getOrThrow();
}
