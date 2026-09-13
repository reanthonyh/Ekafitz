import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const DeleteDayScheduleUseCase({required this._repository}) {
  final DayScheduleRepository _repository;

  Future<void> call({required String id}) =>
      _repository.deleteDaySchedule(id).getOrThrow();
}
