import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:ekafitz/data/datasources/local/ekafitz_db.dart';
import 'package:ekafitz/data/mappers/training_program_mapper.dart';
import 'package:ekafitz/domain/entitites/fitness/training_program.dart';
import 'package:ekafitz/domain/repositories.dart'
    show TrainingProgramRepository;
import 'package:result_dart/result_dart.dart';

final class const LocalTrainingProgramRepository(this._db)
    implements TrainingProgramRepository {
  final EkafitzDatabase _db;

  @override
  AsyncResult<TrainingProgram> getTrainingProgram(String id) async {
    try {
      final result = await (_db.select(
        _db.trainingProgramTable,
      )..where((table) => table.id.equals(id))).getSingle();

      return TrainingProgramMapper.mapFromTableData(result).toSuccess();
    } catch (e) {
      log(e.toString());
      return Exception('LocalTrainingProgramRepository - getTrainingProgram')
          .toFailure();
    }
  }

  @override
  AsyncResult<List<TrainingProgram>> getAllTrainingPrograms() async {
    try {
      final result = await _db.select(_db.trainingProgramTable).get();

      return result
          .map(TrainingProgramMapper.mapFromTableData)
          .toList()
          .toSuccess();
    } catch (e) {
      log(e.toString());
      return Exception(
        'LocalTrainingProgramRepository - getAllTrainingPrograms',
      ).toFailure();
    }
  }

  @override
  AsyncResult<List<TrainingProgram>> getTrainingProgramsByFitnessProfile(
    String fitnessProfileId,
  ) async {
    try {
      final result =
          await (_db.select(_db.trainingProgramTable)..where(
                (table) => table.fitnessProfileId.equals(fitnessProfileId),
              ))
              .get();

      return result
          .map(TrainingProgramMapper.mapFromTableData)
          .toList()
          .toSuccess();
    } catch (e) {
      log(e.toString());
      return Exception(
        'LocalTrainingProgramRepository - getTrainingProgramsByFitnessProfile',
      ).toFailure();
    }
  }

  @override
  AsyncResult<Unit> saveTrainingProgram(TrainingProgram program) async {
    try {
      final companion = TrainingProgramMapper.toTableCompanion(program);
      await _db.trainingProgramTable.insertOne(companion);

      return unit.toSuccess();
    } catch (e) {
      log(e.toString());
      return Exception('LocalTrainingProgramRepository - saveTrainingProgram')
          .toFailure();
    }
  }

  @override
  AsyncResult<Unit> updateTrainingProgram(TrainingProgram program) async {
    try {
      final companion = TrainingProgramMapper.toTableCompanion(program);

      final programId = program.id!;

      await (_db.update(
        _db.trainingProgramTable,
      )..where((table) => table.id.equals(programId))).write(companion);

      return unit.toSuccess();
    } catch (e) {
      log(e.toString());
      return Exception('LocalTrainingProgramRepository - updateTrainingProgram')
          .toFailure();
    }
  }

  @override
  AsyncResult<Unit> deleteTrainingProgram(String id) async {
    try {
      await (_db.delete(
        _db.trainingProgramTable,
      )..where((table) => table.id.equals(id))).go();

      return unit.toSuccess();
    } catch (e) {
      log(e.toString());
      return Exception('LocalTrainingProgramRepository - deleteTrainingProgram')
          .toFailure();
    }
  }
}
