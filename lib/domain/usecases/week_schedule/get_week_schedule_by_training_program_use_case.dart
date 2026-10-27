import 'package:ekafitz/domain/entities.dart' show WeekSchedule;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const GetWeekSchedulesByTrainingProgramUseCase({
  required this._repository,
}) {
  final WeekScheduleRepository _repository;

  Future<List<WeekSchedule>> call({required String trainingProgramId}) =>
      _repository
          .getWeekSchedulesByTrainingProgram(trainingProgramId)
          .getOrThrow();
}