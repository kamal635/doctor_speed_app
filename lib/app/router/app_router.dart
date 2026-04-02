import 'package:doctor_speed_app/shared/widgets/buttons/app_button.dart';
import 'package:doctor_speed_app/shared/widgets/feedback/app_snackbar.dart';
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
      body: Center(
        child: Column(
          children: [
            AppButton(
              isExpanded: false,
              label: 'label',
              onPressed: () {
                showAppSnackBar(
                  context,
                  message: 'Upload failed',
                  variant: AppSnackBarVariant.success,
                  actionLabel: 'Retry',
                  onActionPressed: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
