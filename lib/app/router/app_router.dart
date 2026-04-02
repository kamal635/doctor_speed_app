import 'package:doctor_speed_app/shared/widgets/app_gaps.dart';
import 'package:doctor_speed_app/shared/widgets/loading/app_loading_indicator.dart';
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
      body: Column(
        children: [
          AppGaps.h12,
          const AppLoadingIndicator(),
          Center(
            child: Text(
              'Router is ready',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
