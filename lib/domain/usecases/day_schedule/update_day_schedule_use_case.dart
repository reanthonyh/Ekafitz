import 'package:ekafitz/domain/entities.dart' show DaySchedule;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const UpdateDayScheduleUseCase({required this._repository}) {
  final DayScheduleRepository _repository;

  Future<void> call(DaySchedule daySchedule) =>
      _repository.updateDaySchedule(daySchedule).getOrThrow();
}
