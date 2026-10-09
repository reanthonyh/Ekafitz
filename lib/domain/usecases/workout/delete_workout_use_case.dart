import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const DeleteWorkoutUseCase({required this._repository}) {
  final WorkoutRepository _repository;

  Future<void> call({required int id}) =>
      _repository.deleteWorkout(id).getOrThrow();
}
