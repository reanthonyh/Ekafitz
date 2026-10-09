// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'intl.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class EkafitzDictionaryEn extends EkafitzDictionary {
  EkafitzDictionaryEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'EKafitz';

  @override
  String get personal_info_title => 'Your personal info';

  @override
  String age_label(int age) {
    return 'Age: $age yrs';
  }

  @override
  String email_label(String email) {
    return 'Email: $email';
  }

  @override
  String get home_title => 'EKafitz';

  @override
  String get home_user_profile_title => 'User Profile';

  @override
  String get home_user_profile_subtitle => 'View your personal info';

  @override
  String get home_workouts_title => 'Workouts';

  @override
  String get home_workouts_subtitle => 'Create and manage your exercises';

  @override
  String get home_training_programs_title => 'Training Programs';

  @override
  String get home_training_programs_subtitle =>
      'Create and manage your training plans';

  @override
  String get new_workout_title => 'New Workout';

  @override
  String get edit_workout_title => 'Edit Workout';

  @override
  String get new_training_program_title => 'New Training Program';

  @override
  String get edit_training_program_title => 'Edit Training Program';

  @override
  String get name_label => 'Name';

  @override
  String get description_label => 'Description';

  @override
  String get sets_label => 'Sets';

  @override
  String get reps_label => 'Reps';

  @override
  String get weight_label => 'Weight (kg)';

  @override
  String get equipment_label => 'Equipment';

  @override
  String get none_label => 'None';

  @override
  String get equipment_dumbell => 'Dumbbell';

  @override
  String get fitness_profile_id_label => 'Fitness Profile ID';

  @override
  String get program_duration_label => 'Program Duration (weeks)';

  @override
  String get start_date_label => 'Start Date';

  @override
  String get save_button => 'Save';

  @override
  String get cancel_button => 'Cancel';

  @override
  String get delete_button => 'Delete';

  @override
  String get edit_button => 'Edit';

  @override
  String get add_workout_button => 'Add Workout';

  @override
  String get add_training_program_button => 'Add Program';

  @override
  String get empty_workouts => 'No workouts yet. Tap + to create one.';

  @override
  String get empty_training_programs =>
      'No training programs yet. Tap + to create one.';

  @override
  String get field_required => 'This field is required';

  @override
  String get invalid_number => 'Enter a valid number';

  @override
  String get invalid_positive_number => 'Enter a value greater than zero';

  @override
  String get save_error => 'Could not save. Please try again.';

  @override
  String get load_error_workouts => 'There was an error loading your workouts';

  @override
  String get load_error_training_programs =>
      'There was an error loading your training programs';

  @override
  String get retry_button => 'Retry';
}
