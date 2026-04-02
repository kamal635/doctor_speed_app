import 'package:doctor_speed_app/core/errors/failure.dart';
import 'package:doctor_speed_app/core/errors/failure_code.dart';
import 'package:doctor_speed_app/shared/widgets/state_views/app_error_state.dart';
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
      body: AppErrorState(
        failure: Failure(
          code: FailureCode.forbidden,
          message: 'This is a placeholder page.',
        ),
        actionLabel: 'Retry',
        onActionPressed: () {},
      ),
    );
  }
}
