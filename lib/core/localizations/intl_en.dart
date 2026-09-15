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
}
