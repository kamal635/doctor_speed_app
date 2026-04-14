import 'package:doctor_speed_app/core/extensions/build_context_theme_x.dart';
import 'package:doctor_speed_app/shared/design_system/app_colors.dart';
import 'package:doctor_speed_app/shared/design_system/app_durations.dart';
import 'package:doctor_speed_app/shared/design_system/app_elevation.dart';
import 'package:doctor_speed_app/shared/design_system/app_gaps.dart';
import 'package:doctor_speed_app/shared/design_system/app_icon_size.dart';
import 'package:doctor_speed_app/shared/design_system/app_radius.dart';
import 'package:doctor_speed_app/shared/design_system/app_shadows.dart';
import 'package:doctor_speed_app/shared/design_system/app_spacing.dart';
import 'package:doctor_speed_app/shared/icons/app_icons.dart';
import 'package:doctor_speed_app/shared/widgets/buttons/app_text_button.dart';
import 'package:flutter/material.dart';

enum AppSnackBarVariant { success, error, info }

void showAppSnackBar(
  BuildContext context, {
  required String message,
  AppSnackBarVariant variant = AppSnackBarVariant.info,
  String? actionLabel,
  VoidCallback? onActionPressed,
  Duration duration = AppDurations.snackbar,
}) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.hideCurrentSnackBar();

  messenger.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: AppElevation.none,
      margin: const EdgeInsets.all(AppSpacing.s16),
      duration: duration,
      content: _AppSnackBarContent(
        message: message,
        variant: variant,
        actionLabel: actionLabel,
        onActionPressed: () {
          messenger.hideCurrentSnackBar();
          onActionPressed?.call();
        },
      ),
    ),
  );
}

class _AppSnackBarContent extends StatelessWidget {
  const _AppSnackBarContent({
    required this.message,
    required this.variant,
    this.actionLabel,
    this.onActionPressed,
  });

  final String message;
  final AppSnackBarVariant variant;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final colors = _resolveColors(colorScheme);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppRadius.radiusLg,
        boxShadow: AppShadows.md,
        border: BorderDirectional(
          start: BorderSide(color: colors.accent, width: AppSpacing.s4),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s16,
        vertical: AppSpacing.s16,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.s8),
            decoration: BoxDecoration(
              color: colors.accentSoft,
              shape: BoxShape.circle,
            ),

            alignment: Alignment.center,

            child: Icon(
              colors.icon,
              size: AppIconSize.xs,
              color: colors.accent,
            ),
          ),

          AppGaps.w12,

          Expanded(child: Text(message, style: textTheme.bodyMedium)),

          if (actionLabel != null && onActionPressed != null) ...[
            AppGaps.w12,

            AppTextButton(
              label: actionLabel!,
              onPressed: onActionPressed,
              foregroundColor: colors.accent,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ],
      ),
    );
  }

  _SnackBarColors _resolveColors(ColorScheme colorScheme) {
    switch (variant) {
      case AppSnackBarVariant.success:
        const accent = AppColors.success;
        return _SnackBarColors(
          accent: accent,
          accentSoft: accent.withValues(alpha: 0.12),
          icon: AppIcons.success,
        );

      case AppSnackBarVariant.error:
        final accent = colorScheme.error;
        return _SnackBarColors(
          accent: accent,
          accentSoft: accent.withValues(alpha: 0.12),
          icon: AppIcons.error,
        );

      case AppSnackBarVariant.info:
        final accent = colorScheme.primary;
        return _SnackBarColors(
          accent: accent,
          accentSoft: accent.withValues(alpha: 0.12),
          icon: AppIcons.info,
        );
    }
  }
}

class _SnackBarColors {
  const _SnackBarColors({
    required this.accent,
    required this.accentSoft,
    required this.icon,
  });

  final Color accent;
  final Color accentSoft;
  final IconData icon;
}
