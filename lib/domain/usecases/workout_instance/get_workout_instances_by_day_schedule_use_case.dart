import 'package:ekafitz/domain/entities.dart' show WorkoutInstance;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const GetWorkoutInstancesByDayScheduleUseCase({
  required this._repository,
}) {
  final WorkoutInstanceRepository _repository;

  Future<List<WorkoutInstance>> call({required String dayScheduleId}) =>
      _repository.getWorkoutInstancesByDaySchedule(dayScheduleId).getOrThrow();
}
