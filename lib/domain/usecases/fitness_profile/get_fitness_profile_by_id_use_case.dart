import 'package:ekafitz/domain/entities.dart' show FitnessProfile;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const GetFitnessProfileByIdUseCase({required this._repository}) {
  final FitnessProfileRepository _repository;

  Future<FitnessProfile> call({required String id}) =>
      _repository.getFitnessProfileById(id).getOrThrow();
}
