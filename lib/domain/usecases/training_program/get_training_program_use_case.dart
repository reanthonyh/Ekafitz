import 'package:ekafitz/domain/entities.dart' show TrainingProgram;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const GetTrainingProgramUseCase({required this._repository}) {
  final TrainingProgramRepository _repository;

  Future<TrainingProgram> call({required String id}) =>
      _repository.getTrainingProgram(id).getOrThrow();
}
