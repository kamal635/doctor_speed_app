import 'package:doctor_speed_app/shared/widgets/state_views/app_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.root,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.root,
      builder: (context, state) {
        return const _PlaceholderPage();
      },
    ),
  ],
);

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctor Speed')),
      body: AppEmptyState(
        title: 'No doctors found',
        message: 'Try changing your search or filters.',
        actionLabel: 'Retry',
        onActionPressed: () {},
      ),
    );
  }
}
