import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const DeleteWorkoutInstanceUseCase({required this._repository}) {
  final WorkoutInstanceRepository _repository;

  Future<void> call({required String id}) =>
      _repository.deleteWorkoutInstance(id).getOrThrow();
}
