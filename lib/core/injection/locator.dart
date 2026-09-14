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

  // Use Cases
  final userRepository = getIt<UserRepository>();
  getIt.registerSingleton(GetUserUseCase(repository: userRepository));
  getIt.registerSingleton(SaveUserUseCase(repository: userRepository));
}
