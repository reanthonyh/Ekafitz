import 'package:result_dart/result_dart.dart';

import '../entities.dart';

abstract interface class FitnessProfileRepository {
  AsyncResult<FitnessProfile> getFitnessProfile(String userId);
  AsyncResult<FitnessProfile> getFitnessProfileById(String id);
  AsyncResult<Unit> saveFitnessProfile(FitnessProfile profile);
  AsyncResult<Unit> updateFitnessProfile(FitnessProfile profile);
}
