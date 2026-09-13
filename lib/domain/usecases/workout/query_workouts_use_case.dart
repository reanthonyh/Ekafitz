import 'package:ekafitz/domain/entities.dart' show Workout, WorkoutEquipment;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const QueryWorkoutsUseCase({required this._repository}) {
  final WorkoutRepository _repository;

  Future<List<Workout>> call({
    String? name,
    String? description,
    WorkoutEquipment? equipment,
  }) => _repository
      .queryWorkouts(name: name, description: description, equipment: equipment)
      .getOrThrow();
}
