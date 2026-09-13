import 'package:ekafitz/domain/entities.dart' show WorkoutInstance;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const GetWorkoutInstanceUseCase({required this._repository}) {
  final WorkoutInstanceRepository _repository;

  Future<WorkoutInstance> call({required String id}) =>
      _repository.getWorkoutInstance(id).getOrThrow();
}
