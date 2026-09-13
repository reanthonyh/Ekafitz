import 'package:ekafitz/domain/entities.dart' show ProgramWeek;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const GetProgramWeeksByTrainingProgramUseCase({
  required this._repository,
}) {
  final ProgramWeekRepository _repository;

  Future<List<ProgramWeek>> call({required String trainingProgramId}) =>
      _repository
          .getProgramWeeksByTrainingProgram(trainingProgramId)
          .getOrThrow();
}
