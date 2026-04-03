import 'package:doctor_speed_app/core/extensions/build_context_theme_x.dart';
import 'package:doctor_speed_app/shared/design_system/app_gaps.dart';
import 'package:flutter/material.dart';

import '../buttons/app_button.dart';

class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.inbox_outlined,
    this.actionLabel,
    this.onActionPressed,
  });

  final String title;
  final String message;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: colorScheme.outline),

            AppGaps.h16,

            Text(
              title,
              style: textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),

            AppGaps.h8,

            Text(
              message,
              style: textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            if (actionLabel != null && onActionPressed != null) ...[
              AppGaps.h16,

              AppButton(
                label: actionLabel!,
                isExpanded: false,
                onPressed: onActionPressed,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
