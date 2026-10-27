import 'package:ekafitz/domain/entities.dart' show WeekSchedule;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const UpdateWeekScheduleUseCase({required this._repository}) {
  final WeekScheduleRepository _repository;

  Future<void> call({required WeekSchedule week}) =>
      _repository.updateWeekSchedule(week).getOrThrow();
}
