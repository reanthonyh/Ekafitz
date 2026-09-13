import 'package:ekafitz/domain/entities.dart' show FitnessProfile;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const UpdateFitnessProfileUseCase({required this._repository}) {
  final FitnessProfileRepository _repository;

  Future<void> call(FitnessProfile profile) =>
      _repository.updateFitnessProfile(profile).getOrThrow();
}
