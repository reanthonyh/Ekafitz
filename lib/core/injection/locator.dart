import 'dart:developer';

import 'package:ekafitz/data/datasources/local/ekafitz_db.dart';
import 'package:ekafitz/data/repositories.dart';
import 'package:ekafitz/domain/repositories.dart';
import 'package:ekafitz/domain/usecases.dart';
import 'package:get_it/get_it.dart';

void initializeRepositories() {
  final getIt = GetIt.instance;

  // DB
  getIt.registerLazySingleton(
    () => EkafitzDatabase(),
    instanceName: 'db',
    onCreated: (instance) {
      log(
        'Created the Ekafitz Drift Database ( ver. ${instance.schemaVersion} )',
      );
    },
  );

  // Repositories
  final db = getIt<EkafitzDatabase>(instanceName: 'db');
  getIt.registerSingleton<UserRepository>(LocalUserRepository(db));
  getIt.registerSingleton<WorkoutRepository>(LocalWorkoutRepository(db));
  getIt.registerSingleton<TrainingProgramRepository>(
    LocalTrainingProgramRepository(db),
  );

  // Use Cases
  final userRepository = getIt<UserRepository>();
  getIt.registerSingleton(GetUserUseCase(repository: userRepository));
  getIt.registerSingleton(SaveUserUseCase(repository: userRepository));

  final workoutRepository = getIt<WorkoutRepository>();
  getIt.registerSingleton(GetWorkoutUseCase(repository: workoutRepository));
  getIt.registerSingleton(GetAllWorkoutsUseCase(repository: workoutRepository));
  getIt.registerSingleton(QueryWorkoutsUseCase(repository: workoutRepository));
  getIt.registerSingleton(SaveWorkoutUseCase(repository: workoutRepository));
  getIt.registerSingleton(UpdateWorkoutUseCase(repository: workoutRepository));
  getIt.registerSingleton(DeleteWorkoutUseCase(repository: workoutRepository));

  final trainingProgramRepository = getIt<TrainingProgramRepository>();
  getIt.registerSingleton(
    GetTrainingProgramUseCase(repository: trainingProgramRepository),
  );
  getIt.registerSingleton(
    GetAllTrainingProgramsUseCase(repository: trainingProgramRepository),
  );
  getIt.registerSingleton(
    GetTrainingProgramsByFitnessProfileUseCase(
      repository: trainingProgramRepository,
    ),
  );
  getIt.registerSingleton(
    SaveTrainingProgramUseCase(repository: trainingProgramRepository),
  );
  getIt.registerSingleton(
    UpdateTrainingProgramUseCase(repository: trainingProgramRepository),
  );
  getIt.registerSingleton(
    DeleteTrainingProgramUseCase(repository: trainingProgramRepository),
  );
}
