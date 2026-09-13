import 'package:ekafitz/domain/entities.dart' show ProgramWeek;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const SaveProgramWeekUseCase({required this._repository}) {
  final ProgramWeekRepository _repository;

  Future<void> call(ProgramWeek week) =>
      _repository.saveProgramWeek(week).getOrThrow();
}
