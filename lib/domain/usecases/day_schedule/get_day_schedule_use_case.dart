import 'package:ekafitz/domain/entities.dart' show DaySchedule;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const GetDayScheduleUseCase({required this._repository}) {
  final DayScheduleRepository _repository;

  Future<DaySchedule> call({required String id}) =>
      _repository.getDaySchedule(id).getOrThrow();
}
