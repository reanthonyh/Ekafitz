import 'package:ekafitz/core/localizations/intl.dart';
import 'package:flutter/widget_previews.dart';
import 'package:material_ui/material_ui.dart';

PreviewLocalizationsData _ekafitzLocalizationsData() => const .new(
  localizationsDelegates: EkafitzDictionary.localizationsDelegates,
  supportedLocales: EkafitzDictionary.supportedLocales,
);

final class const EkafitzPreview({
  super.name,
  super.group,
  super.size,
  super.brightness,
}) extends Preview {
  this
    : super(
        theme: _EkafitzPreviewData.new,
        localizations: _ekafitzLocalizationsData,
      );
}

final class const _EkafitzPreviewData({final Brightness? _brightness})
    extends PreviewThemeData {
  @override
  Widget apply(BuildContext context, Widget child) => Theme(
    data: .from(
      colorScheme: .fromSeed(
        seedColor: Colors.red,
        brightness: _brightness ?? MediaQuery.platformBrightnessOf(context),
      ),
    ),
    child: child,
  );
}
