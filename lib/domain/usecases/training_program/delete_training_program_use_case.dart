import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const DeleteTrainingProgramUseCase({required this._repository}) {
  final TrainingProgramRepository _repository;

  Future<void> call({required String id}) =>
      _repository.deleteTrainingProgram(id).getOrThrow();
}
