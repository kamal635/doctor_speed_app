import 'package:doctor_speed_app/core/extensions/build_context_responsive_x.dart';
import 'package:doctor_speed_app/core/extensions/build_context_theme_x.dart';
import 'package:doctor_speed_app/shared/design_system/app_colors.dart';
import 'package:doctor_speed_app/shared/design_system/app_gaps.dart';
import 'package:doctor_speed_app/shared/design_system/app_radius.dart';
import 'package:doctor_speed_app/shared/design_system/app_spacing.dart';
import 'package:flutter/material.dart';

import 'app_loading_indicator.dart';

class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.message,
    this.barrierColor,
    this.dismissKeyboardOnLoading = true,
  });

  final bool isLoading;
  final Widget child;
  final String? message;
  final Color? barrierColor;
  final bool dismissKeyboardOnLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading && dismissKeyboardOnLoading) {
      context.unfocus();
    }

    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: ColoredBox(
              color: barrierColor ?? AppColors.black.withValues(alpha: 0.3),
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.s24,
                    vertical: AppSpacing.s16,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: AppRadius.radiusLg,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AppLoadingIndicator(),
                      if (message != null) ...[
                        AppGaps.h12,
                        Text(
                          message!,
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
