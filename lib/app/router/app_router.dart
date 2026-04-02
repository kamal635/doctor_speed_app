import 'package:doctor_speed_app/shared/widgets/buttons/app_button.dart';
import 'package:doctor_speed_app/shared/widgets/buttons/app_outlined_button.dart';
import 'package:doctor_speed_app/shared/widgets/feedback/app_dialog.dart';
import 'package:doctor_speed_app/shared/widgets/inputs/app_text_field.dart';
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
                showAppDialog(
                  context,
                  child: AppDialog(
                    content: AppTextField(
                      // controller: controller,
                      hintText: 'File name',
                    ),
                    title: 'Delete document?',
                    message: 'This action cannot be undone.',
                    icon: const Icon(Icons.delete_outline, size: 40),
                    actions: [
                      AppButton(
                        label: 'Delete',
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                      AppOutlinedButton(
                        label: 'Cancel',
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
