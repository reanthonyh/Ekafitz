import 'package:ekafitz/domain/entities.dart' show Workout;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const GetWorkoutUseCase({required this._repository}) {
  final WorkoutRepository _repository;

  Future<Workout> call({required int id}) =>
      _repository.getWorkoutById(id: id).getOrThrow();
}
