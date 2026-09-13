import 'package:ekafitz/domain/entities.dart' show ProgramWeek;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const UpdateProgramWeekUseCase({required this._repository}) {
  final ProgramWeekRepository _repository;

  Future<void> call({required ProgramWeek week}) =>
      _repository.updateProgramWeek(week).getOrThrow();
}
