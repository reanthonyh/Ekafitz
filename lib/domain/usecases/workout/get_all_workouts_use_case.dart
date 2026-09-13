import 'package:ekafitz/domain/entities.dart' show Workout;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const GetAllWorkoutsUseCase({required this._repository}) {
  final WorkoutRepository _repository;

  Future<List<Workout>> call() => _repository.getAllWorkouts().getOrThrow();
}
