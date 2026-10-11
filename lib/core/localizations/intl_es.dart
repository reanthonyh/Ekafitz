// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'intl.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class EkafitzDictionaryEs extends EkafitzDictionary {
  EkafitzDictionaryEs([String locale = 'es']) : super(locale);

  @override
  String get app_name => 'EKafitz';

  @override
  String get personal_info_title => 'Tu información personal';

  @override
  String age_label(int age) {
    return 'Edad: $age años';
  }

  @override
  String email_label(String email) {
    return 'Correo: $email';
  }

  @override
  String get home_title => 'EKafitz';

  @override
  String get home_user_profile_title => 'Perfil de Usuario';

  @override
  String get home_user_profile_subtitle => 'Ver tu información personal';

  @override
  String get home_workouts_title => 'Entrenamientos';

  @override
  String get home_workouts_subtitle => 'Crea y gestiona tus ejercicios';

  @override
  String get home_training_programs_title => 'Programas de Entrenamiento';

  @override
  String get home_training_programs_subtitle =>
      'Crea y gestiona tus planes de entrenamiento';

  @override
  String get new_workout_title => 'Nuevo Entrenamiento';

  @override
  String get edit_workout_title => 'Editar Entrenamiento';

  @override
  String get new_training_program_title => 'Nuevo Programa de Entrenamiento';

  @override
  String get edit_training_program_title => 'Editar Programa de Entrenamiento';

  @override
  String get name_label => 'Nombre';

  @override
  String get description_label => 'Descripción';

  @override
  String get sets_label => 'Series';

  @override
  String get reps_label => 'Repeticiones';

  @override
  String get weight_label => 'Peso (kg)';

  @override
  String get equipment_label => 'Equipo';

  @override
  String get none_label => 'Ninguno';

  @override
  String get equipment_dumbell => 'Mancuerna';

  @override
  String get fitness_profile_id_label => 'ID del Perfil de Fitness';

  @override
  String get program_duration_label => 'Duración del Programa (semanas)';

  @override
  String get start_date_label => 'Fecha de Inicio';

  @override
  String get save_button => 'Guardar';

  @override
  String get cancel_button => 'Cancelar';

  @override
  String get delete_button => 'Eliminar';

  @override
  String get edit_button => 'Editar';

  @override
  String get add_workout_button => 'Agregar Entrenamiento';

  @override
  String get add_training_program_button => 'Agregar Programa';

  @override
  String get empty_workouts =>
      'No hay entrenamientos aún. Toca + para crear uno.';

  @override
  String get empty_training_programs =>
      'No hay programas de entrenamiento aún. Toca + para crear uno.';

  @override
  String get field_required => 'Este campo es obligatorio';

  @override
  String get invalid_number => 'Ingresa un número válido';

  @override
  String get invalid_positive_number => 'Ingresa un valor mayor a cero';

  @override
  String get save_error => 'No se pudo guardar. Por favor, intenta de nuevo.';

  @override
  String get load_error_workouts =>
      'Hubo un error al cargar tus entrenamientos';

  @override
  String get load_error_training_programs =>
      'Hubo un error al cargar tus programas de entrenamiento';

  @override
  String get retry_button => 'Reintentar';
}
