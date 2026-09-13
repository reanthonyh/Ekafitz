import 'package:result_dart/result_dart.dart';

import '../entities.dart';

abstract interface class ProgramWeekRepository {
  AsyncResult<ProgramWeek> getProgramWeek(String id);
  AsyncResult<List<ProgramWeek>> getProgramWeeksByTrainingProgram(
    String trainingProgramId,
  );
  AsyncResult<Unit> saveProgramWeek(ProgramWeek week);
  AsyncResult<Unit> updateProgramWeek(ProgramWeek week);
  AsyncResult<Unit> deleteProgramWeek(String id);
}
