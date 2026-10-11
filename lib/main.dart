import 'package:ekafitz/core/localizations/intl.dart';
import 'package:ekafitz/presentation/router/main_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import 'core/injection/locator.dart';
import 'core/theme/ekafitz_theme.dart';

void main() {
  initializeRepositories();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final TextTheme textTheme = createTextTheme(
      context,
      'Share Tech Mono',
      'Inter',
    );
    final theme = EkafitzTheme(textTheme);

    return MaterialApp.router(
      title: 'Ekafitz',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),

      routerConfig: mainRouter,

      supportedLocales: EkafitzDictionary.supportedLocales,
      localizationsDelegates: EkafitzDictionary.localizationsDelegates,
    );
  }
}
