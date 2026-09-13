import 'package:ekafitz/domain/entities.dart' show ProgramWeek;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const GetProgramWeekUseCase({required this._repository}) {
  final ProgramWeekRepository _repository;

  Future<ProgramWeek> call({required String id}) =>
      _repository.getProgramWeek(id).getOrThrow();
}
