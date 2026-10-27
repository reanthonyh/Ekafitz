import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const DeleteWeekScheduleUseCase({required this._repository}) {
  final WeekScheduleRepository _repository;

  Future<void> call({required String id}) =>
      _repository.deleteWeekSchedule(id).getOrThrow();
}
