import 'package:ekafitz/domain/entities.dart' show WorkoutInstance;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const SaveWorkoutInstanceUseCase({required this._repository}) {
  final WorkoutInstanceRepository _repository;

  Future<void> call(WorkoutInstance instance) =>
      _repository.saveWorkoutInstance(instance).getOrThrow();
}
