import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

part 'app_routes.dart';

@Singleton()
class AppPages {
  AppPages();

  final initial = Routes.initial;

  late final router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => Container(),
      ),
    ],
  );
}
