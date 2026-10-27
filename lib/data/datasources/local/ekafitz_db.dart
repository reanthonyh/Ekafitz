import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:ekafitz/domain/entities.dart';
import 'package:path_provider/path_provider.dart';

part 'ekafitz_db.g.dart';

class UserTable extends Table {
  TextColumn get id => text()();
  TextColumn get fullName => text().withLength(min: 5, max: 48)();
  TextColumn get email => text().withLength(min: 8, max: 50).unique()();
  DateTimeColumn get birthDate => dateTime().nullable()();
  TextColumn get gender => textEnum<Gender>()(); // Male/Female
  TextColumn get passwordHash => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

class FitnessProfileTable extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(UserTable, #id)();
  IntColumn get age => integer()();
  RealColumn get height => real()();
  RealColumn get weight => real()();
  TextColumn get bodySomatotype =>
      textEnum<BodySomatotype>()(); // mesomorph, ectomorph, endomorph
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

class TrainingProgramTable extends Table {
  TextColumn get id => text()();
  TextColumn get fitnessProfileId =>
      text().references(FitnessProfileTable, #id)();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  IntColumn get programDuration => integer()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

class WeekScheduleTable extends Table {
  TextColumn get id => text()();
  TextColumn get trainingProgramId =>
      text().references(TrainingProgramTable, #id)();
  IntColumn get weekNumber => integer()();
  IntColumn get repetitionDuration => integer()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

class DayScheduleTable extends Table {
  TextColumn get id => text()();
  TextColumn get weekScheduleId => text().references(WeekScheduleTable, #id)();
  TextColumn get dayOfWeek => textEnum<DayOfWeek>()(); // Monday etc.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

class WorkoutTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get workoutName => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  IntColumn get sets => integer().nullable()();
  IntColumn get reps => integer().nullable()();
  RealColumn get weight => real().nullable()();
  TextColumn get equipment => textEnum<WorkoutEquipment>().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class WorkoutInstanceTable extends Table {
  TextColumn get id => text()();
  TextColumn get dayScheduleId => text().references(DayScheduleTable, #id)();
  IntColumn get workoutId => integer().references(WorkoutTable, #id)();
  IntColumn get scheduledReps => integer()();
  RealColumn get scheduledWeight => real()();
  IntColumn get completedReps => integer()();
  RealColumn get completedWeight => real()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    UserTable,
    FitnessProfileTable,
    TrainingProgramTable,
    WeekScheduleTable,
    DayScheduleTable,
    WorkoutTable,
    WorkoutInstanceTable,
  ],
)
class EkafitzDatabase extends _$EkafitzDatabase {
  EkafitzDatabase([QueryExecutor? executor])
    : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    const nameDb = 'ekafitz_db';

    return driftDatabase(
      name: nameDb,
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
