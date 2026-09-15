import 'package:ekafitz/core/localizations/intl.dart';
import 'package:ekafitz/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/injection/locator.dart';

void main() {
  initializeRepositories();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      supportedLocales: EkafitzDictionary.supportedLocales,
      localizationsDelegates: EkafitzDictionary.localizationsDelegates,
    );
  }
}
