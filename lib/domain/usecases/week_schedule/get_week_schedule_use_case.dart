import 'package:ekafitz/domain/entities.dart' show WeekSchedule;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const GetWeekScheduleUseCase({required this._repository}) {
  final WeekScheduleRepository _repository;

  Future<WeekSchedule> call({required String id}) =>
      _repository.getWeekSchedule(id).getOrThrow();
}
