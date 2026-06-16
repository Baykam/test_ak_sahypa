import 'package:ak_sahypa_test/app/router/paths.dart';
import 'package:ak_sahypa_test/app/router/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class AppRouter {
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get globalKey => key;
  GoRouter router = GoRouter(
    navigatorKey: key,
    debugLogDiagnostics: true,
    initialLocation: RoutePaths.News.path,
    routes: [
      NewsRoute(),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Text(state.error?.message ?? ''),
    ),
  );
}