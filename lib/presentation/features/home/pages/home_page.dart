import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

final class const HomePage({super.key}) extends ConsumerWidget {
  static String get routeName => 'home';
  static String get routePath => '/home';

  static Page route({required LocalKey key}) =>
      MaterialPage(key: key, child: HomePage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text('Home'))),
    );
  }
}
