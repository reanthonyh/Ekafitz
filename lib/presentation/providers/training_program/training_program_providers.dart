import 'package:ekafitz/domain/entities.dart';
import 'package:ekafitz/domain/usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'training_program_providers.g.dart';

@riverpod
Future<List<TrainingProgram>> allTrainingPrograms(Ref ref) async {
  final useCase = GetIt.I<GetAllTrainingProgramsUseCase>();

  return useCase();
}

@riverpod
Future<TrainingProgram> trainingProgram(Ref ref, String id) async {
  final useCase = GetIt.I<GetTrainingProgramUseCase>();

  return useCase(id: id);
}
