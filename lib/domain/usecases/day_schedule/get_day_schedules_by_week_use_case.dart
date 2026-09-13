import 'package:ekafitz/domain/entities.dart' show DaySchedule;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const GetDaySchedulesByWeekUseCase({required this._repository}) {
  final DayScheduleRepository _repository;

  Future<List<DaySchedule>> call({required String weekScheduleId}) =>
      _repository.getDaySchedulesByWeek(weekScheduleId).getOrThrow();
}
