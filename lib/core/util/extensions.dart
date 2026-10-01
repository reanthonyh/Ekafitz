import 'package:material_ui/material_ui.dart';

extension ContextExtensions on BuildContext {
  ColorScheme get colors => ColorScheme.of(this);
  TextTheme get textTheme => TextTheme.of(this);
}
