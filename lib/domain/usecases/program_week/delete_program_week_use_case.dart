import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const DeleteProgramWeekUseCase({required this._repository}) {
  final ProgramWeekRepository _repository;

  Future<void> call({required String id}) =>
      _repository.deleteProgramWeek(id).getOrThrow();
}
