import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'intl_en.dart';
import 'intl_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of EkafitzDictionary
/// returned by `EkafitzDictionary.of(context)`.
///
/// Applications need to include `EkafitzDictionary.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localizations/intl.dart';
///
/// return MaterialApp(
///   localizationsDelegates: EkafitzDictionary.localizationsDelegates,
///   supportedLocales: EkafitzDictionary.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the EkafitzDictionary.supportedLocales
/// property.
abstract class EkafitzDictionary {
  EkafitzDictionary(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static EkafitzDictionary? of(BuildContext context) {
    return Localizations.of<EkafitzDictionary>(context, EkafitzDictionary);
  }

  static const LocalizationsDelegate<EkafitzDictionary> delegate =
      _EkafitzDictionaryDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// App Name
  ///
  /// In en, this message translates to:
  /// **'EKafitz'**
  String get app_name;

  /// Text Title for the User Personal Page - title
  ///
  /// In en, this message translates to:
  /// **'Your personal info'**
  String get personal_info_title;

  /// Label that present the age integer
  ///
  /// In en, this message translates to:
  /// **'Age: {age} yrs'**
  String age_label(int age);

  /// Label that presents a email
  ///
  /// In en, this message translates to:
  /// **'Email: {email}'**
  String email_label(String email);

  /// Title shown on the Home navigation page
  ///
  /// In en, this message translates to:
  /// **'EKafitz'**
  String get home_title;

  /// Home entry title for the user profile screen
  ///
  /// In en, this message translates to:
  /// **'User Profile'**
  String get home_user_profile_title;

  /// Home entry subtitle for the user profile screen
  ///
  /// In en, this message translates to:
  /// **'View your personal info'**
  String get home_user_profile_subtitle;

  /// Home entry and list title for workouts
  ///
  /// In en, this message translates to:
  /// **'Workouts'**
  String get home_workouts_title;

  /// Home entry subtitle for workouts
  ///
  /// In en, this message translates to:
  /// **'Create and manage your exercises'**
  String get home_workouts_subtitle;

  /// Home entry and list title for training programs
  ///
  /// In en, this message translates to:
  /// **'Training Programs'**
  String get home_training_programs_title;

  /// Home entry subtitle for training programs
  ///
  /// In en, this message translates to:
  /// **'Create and manage your training plans'**
  String get home_training_programs_subtitle;

  /// Title for the workout creation form
  ///
  /// In en, this message translates to:
  /// **'New Workout'**
  String get new_workout_title;

  /// Title for the workout edit form
  ///
  /// In en, this message translates to:
  /// **'Edit Workout'**
  String get edit_workout_title;

  /// Title for the training program creation form
  ///
  /// In en, this message translates to:
  /// **'New Training Program'**
  String get new_training_program_title;

  /// Title for the training program edit form
  ///
  /// In en, this message translates to:
  /// **'Edit Training Program'**
  String get edit_training_program_title;

  /// Generic name field label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name_label;

  /// Generic description field label
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description_label;

  /// Workout sets field label
  ///
  /// In en, this message translates to:
  /// **'Sets'**
  String get sets_label;

  /// Workout reps field label
  ///
  /// In en, this message translates to:
  /// **'Reps'**
  String get reps_label;

  /// Workout weight field label
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get weight_label;

  /// Workout equipment field label
  ///
  /// In en, this message translates to:
  /// **'Equipment'**
  String get equipment_label;

  /// Label for an optional selection with no value
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none_label;

  /// Workout equipment option for dumbbell
  ///
  /// In en, this message translates to:
  /// **'Dumbbell'**
  String get equipment_dumbell;

  /// Training program fitness profile id field label
  ///
  /// In en, this message translates to:
  /// **'Fitness Profile ID'**
  String get fitness_profile_id_label;

  /// Training program duration field label
  ///
  /// In en, this message translates to:
  /// **'Program Duration (weeks)'**
  String get program_duration_label;

  /// Training program start date field label
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get start_date_label;

  /// Save action button label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save_button;

  /// Cancel action button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel_button;

  /// Delete action button label
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete_button;

  /// Edit action label
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit_button;

  /// Floating action button label for adding a workout
  ///
  /// In en, this message translates to:
  /// **'Add Workout'**
  String get add_workout_button;

  /// Floating action button label for adding a training program
  ///
  /// In en, this message translates to:
  /// **'Add Program'**
  String get add_training_program_button;

  /// Empty state message for the workout list
  ///
  /// In en, this message translates to:
  /// **'No workouts yet. Tap + to create one.'**
  String get empty_workouts;

  /// Empty state message for the training program list
  ///
  /// In en, this message translates to:
  /// **'No training programs yet. Tap + to create one.'**
  String get empty_training_programs;

  /// Validation message for a required form field
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get field_required;

  /// Validation message for an invalid numeric form field
  ///
  /// In en, this message translates to:
  /// **'Enter a valid number'**
  String get invalid_number;

  /// Validation message for a numeric field that must be positive
  ///
  /// In en, this message translates to:
  /// **'Enter a value greater than zero'**
  String get invalid_positive_number;

  /// Error message shown when a save operation fails
  ///
  /// In en, this message translates to:
  /// **'Could not save. Please try again.'**
  String get save_error;

  /// Error message shown when the workout list fails to load
  ///
  /// In en, this message translates to:
  /// **'There was an error loading your workouts'**
  String get load_error_workouts;

  /// Error message shown when the training program list fails to load
  ///
  /// In en, this message translates to:
  /// **'There was an error loading your training programs'**
  String get load_error_training_programs;

  /// Retry action button label
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry_button;
}

class _EkafitzDictionaryDelegate
    extends LocalizationsDelegate<EkafitzDictionary> {
  const _EkafitzDictionaryDelegate();

  @override
  Future<EkafitzDictionary> load(Locale locale) {
    return SynchronousFuture<EkafitzDictionary>(
      lookupEkafitzDictionary(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_EkafitzDictionaryDelegate old) => false;
}

EkafitzDictionary lookupEkafitzDictionary(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return EkafitzDictionaryEn();
    case 'es':
      return EkafitzDictionaryEs();
  }

  throw FlutterError(
    'EkafitzDictionary.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
