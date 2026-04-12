import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes/app_route_names.dart';
import 'routes/app_route_paths.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutePaths.root,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutePaths.root,
      name: AppRouteNames.root,
      builder: (context, state) => const _RoutePlaceholderPage(title: 'Root'),
    ),
    GoRoute(
      path: AppRoutePaths.startup,
      name: AppRouteNames.startup,
      builder: (context, state) =>
          const _RoutePlaceholderPage(title: 'Startup'),
    ),
    GoRoute(
      path: AppRoutePaths.home,
      name: AppRouteNames.home,
      builder: (context, state) => const _RoutePlaceholderPage(title: 'Home'),
    ),
    GoRoute(
      path: AppRoutePaths.login,
      name: AppRouteNames.login,
      builder: (context, state) => const _RoutePlaceholderPage(title: 'Login'),
    ),
  ],
);

class _RoutePlaceholderPage extends StatelessWidget {
  const _RoutePlaceholderPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(title)));
  }
}
