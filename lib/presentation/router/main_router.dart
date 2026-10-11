import 'package:ekafitz/presentation/features/home/pages/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

final mainRouter = GoRouter(
  initialLocation: HomePage.routePath,
  routes: [
    GoRoute(
      path: HomePage.routePath,
      name: HomePage.routeName,
      pageBuilder: (context, state) => HomePage.route(key: state.pageKey),
    ),
  ],

  redirect: (context, state) {
    if (kDebugMode) {
      print('GoRouter Redirect method: $state');
    }

    return null;
  },
);
