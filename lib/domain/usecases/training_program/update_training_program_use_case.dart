import 'package:ekafitz/domain/entities.dart' show TrainingProgram;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const UpdateTrainingProgramUseCase({required this._repository}) {
  final TrainingProgramRepository _repository;

  Future<void> call(TrainingProgram program) =>
      _repository.updateTrainingProgram(program).getOrThrow();
}
