import 'package:ekafitz/domain/entities.dart' show WeekSchedule;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const SaveWeekScheduleUseCase({required this._repository}) {
  final WeekScheduleRepository _repository;

  Future<void> call(WeekSchedule week) =>
      _repository.saveWeekSchedule(week).getOrThrow();
}
