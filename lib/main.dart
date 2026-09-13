import 'package:flutter/material.dart';
import 'package:ekafitz/core/localizations/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
      supportedLocales: EkafitzDictionary.supportedLocales,
      localizationsDelegates: EkafitzDictionary.localizationsDelegates,
    );
  }
}
