import 'package:ekafitz/domain/entities.dart' show TrainingProgram;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const GetAllTrainingProgramsUseCase({required this._repository}) {
  final TrainingProgramRepository _repository;

  Future<List<TrainingProgram>> call() =>
      _repository.getAllTrainingPrograms().getOrThrow();
}
