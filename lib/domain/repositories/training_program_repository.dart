import 'package:result_dart/result_dart.dart';

import '../entities.dart';

abstract interface class TrainingProgramRepository {
  AsyncResult<TrainingProgram> getTrainingProgram(String id);
  AsyncResult<List<TrainingProgram>> getAllTrainingPrograms();
  AsyncResult<List<TrainingProgram>> getTrainingProgramsByFitnessProfile(
    String fitnessProfileId,
  );
  AsyncResult<Unit> saveTrainingProgram(TrainingProgram program);
  AsyncResult<Unit> updateTrainingProgram(TrainingProgram program);
  AsyncResult<Unit> deleteTrainingProgram(String id);
}
