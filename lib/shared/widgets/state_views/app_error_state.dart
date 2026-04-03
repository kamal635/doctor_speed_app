import 'package:doctor_speed_app/core/extensions/build_context_theme_x.dart';
import 'package:doctor_speed_app/shared/design_system/app_gaps.dart';
import 'package:doctor_speed_app/shared/design_system/app_icon_size.dart';
import 'package:doctor_speed_app/shared/design_system/app_spacing.dart';
import 'package:flutter/material.dart';

import '../../../core/errors/failure.dart';
import '../../../core/extensions/failure_x.dart';
import '../buttons/app_button.dart';

class AppErrorState extends StatelessWidget {
  const AppErrorState({
    super.key,
    this.title = 'Something went wrong',
    this.message,
    this.failure,
    this.icon = Icons.error_outline,
    this.actionLabel,
    this.onActionPressed,
  });

  final String title;
  final String? message;
  final Failure? failure;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final resolvedMessage = message ?? failure?.displayMessage;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.s24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: AppIconSize.xxl, color: colorScheme.error),

            AppGaps.h16,

            Text(
              title,
              style: textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            if (resolvedMessage != null) ...[
              AppGaps.h8,

              Text(
                resolvedMessage,
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
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
