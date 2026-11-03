import 'package:drift/drift.dart';
import 'package:ekafitz/data/datasources/local/ekafitz_db.dart';
import 'package:ekafitz/domain/entitites/fitness/training_program.dart';
import 'package:uuid/uuid.dart';

abstract class TrainingProgramMapper {
  static TrainingProgram mapFromTableData(TrainingProgramTableData data) {
    return TrainingProgram(
      id: data.id,
      fitnessProfileId: data.fitnessProfileId,
      name: data.name,
      description: data.description ?? '',
      programDuration: data.programDuration,
      startDate: data.startDate ?? data.createdAt,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt ?? data.createdAt,
    );
  }

  static TrainingProgramTableCompanion toTableCompanion(
    TrainingProgram program,
  ) {
    final id = switch (program.id) {
      String value when value.isNotEmpty => value,
      _ => Uuid().v4(),
    };

    return TrainingProgramTableCompanion(
      id: Value(id),
      fitnessProfileId: Value(program.fitnessProfileId),
      name: Value(program.name),
      description: Value(program.description),
      programDuration: Value(program.programDuration),
      startDate: Value(program.startDate),
      createdAt: Value(program.createdAt),
      updatedAt: Value(DateTime.now()),
    );
  }
}
