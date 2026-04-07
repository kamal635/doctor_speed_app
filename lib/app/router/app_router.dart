import 'package:doctor_speed_app/shared/layouts/app_safe_area_page.dart';
import 'package:doctor_speed_app/shared/widgets/buttons/app_button.dart';
import 'package:doctor_speed_app/shared/widgets/feedback/app_confirm_dialog.dart';
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
      body: AppSafeAreaPage(
        child: Center(
          child: Column(
            children: [
              AppButton(
                // isExpanded: false,
                label: 'label',
                onPressed: () async {
                  await showAppConfirmDialog(
                    context,
                    title: 'title',
                    variant: AppConfirmDialogVariant.logout,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
