import 'package:ekafitz/domain/entities.dart';
import 'package:ekafitz/domain/usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_providers.g.dart';

@riverpod
Future<List<Workout>> allWorkouts(Ref ref) async {
  final useCase = GetIt.I<GetAllWorkoutsUseCase>();

  return useCase();
}

@riverpod
Future<Workout> workout(Ref ref, int id) async {
  final useCase = GetIt.I<GetWorkoutUseCase>();

  return useCase(id: id);
}
