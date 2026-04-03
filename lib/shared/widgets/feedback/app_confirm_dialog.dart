import 'package:doctor_speed_app/shared/design_system/app_colors.dart';
import 'package:doctor_speed_app/shared/design_system/app_icon_size.dart';
import 'package:doctor_speed_app/shared/design_system/app_spacing.dart';
import 'package:flutter/material.dart';

import '../buttons/app_button.dart';
import '../buttons/app_outlined_button.dart';
import 'app_dialog.dart';

enum AppConfirmDialogVariant { confirm, logout, delete, warning }

Future<bool?> showAppConfirmDialog(
  BuildContext context, {
  required String title,
  String? message,
  String? confirmLabel,
  String? cancelLabel,
  Widget? icon,
  Color? iconBackgroundColor,
  bool barrierDismissible = true,
  bool useRootNavigator = true,
  AppConfirmDialogVariant variant = AppConfirmDialogVariant.confirm,
}) {
  return showAppDialog<bool>(
    context,
    barrierDismissible: barrierDismissible,
    useRootNavigator: useRootNavigator,
    child: AppConfirmDialog(
      title: title,
      message: message,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
      icon: icon,
      iconBackgroundColor: iconBackgroundColor,
      variant: variant,
    ),
  );
}

class AppConfirmDialog extends StatelessWidget {
  const AppConfirmDialog({
    super.key,
    required this.title,
    this.message,
    this.confirmLabel,
    this.cancelLabel,
    this.icon,
    this.iconBackgroundColor,
    this.variant = AppConfirmDialogVariant.confirm,
  });

  final String title;
  final String? message;
  final String? confirmLabel;
  final String? cancelLabel;
  final Widget? icon;
  final Color? iconBackgroundColor;
  final AppConfirmDialogVariant variant;

  bool get _isDestructive =>
      variant == AppConfirmDialogVariant.logout ||
      variant == AppConfirmDialogVariant.delete;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final config = _resolveConfig(colorScheme);

    return AppDialog(
      title: title,
      message: message,
      icon: Container(
        padding: const EdgeInsets.all(AppSpacing.s16),
        decoration: BoxDecoration(
          color: iconBackgroundColor ?? config.iconBackgroundColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child:
            icon ??
            Icon(
              config.iconData,
              size: AppIconSize.xxl,
              color: config.iconColor,
            ),
      ),
      actions: [
        AppButton(
          variant: _isDestructive
              ? AppButtonVariant.destructive
              : AppButtonVariant.primary,
          label: confirmLabel ?? config.defaultConfirmLabel,
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        AppOutlinedButton(
          label: cancelLabel ?? config.cancelLabelOverride,
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }

  _AppConfirmDialogConfig _resolveConfig(ColorScheme colorScheme) {
    switch (variant) {
      case AppConfirmDialogVariant.confirm:
        return _AppConfirmDialogConfig(
          iconData: Icons.check_circle,
          iconColor: AppColors.success,
          iconBackgroundColor: AppColors.success.withValues(alpha: 0.12),
          defaultConfirmLabel: 'Confirm',
        );

      case AppConfirmDialogVariant.logout:
        return _AppConfirmDialogConfig(
          iconData: Icons.logout,
          iconColor: colorScheme.error,
          iconBackgroundColor: colorScheme.error.withValues(alpha: 0.12),
          defaultConfirmLabel: 'Log out',
        );

      case AppConfirmDialogVariant.delete:
        return _AppConfirmDialogConfig(
          iconData: Icons.delete_forever,
          iconColor: colorScheme.error,
          iconBackgroundColor: colorScheme.error.withValues(alpha: 0.12),
          defaultConfirmLabel: 'Delete',
        );

      case AppConfirmDialogVariant.warning:
        return _AppConfirmDialogConfig(
          iconData: Icons.warning,
          iconColor: AppColors.warning,
          iconBackgroundColor: AppColors.warning.withValues(alpha: 0.12),
          defaultConfirmLabel: 'Save and Exit',
          cancelLabelOverride: 'Discard Changes',
        );
    }
  }
}

class _AppConfirmDialogConfig {
  const _AppConfirmDialogConfig({
    required this.iconData,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.defaultConfirmLabel,
    this.cancelLabelOverride = 'Cancel',
  });

  final IconData iconData;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String defaultConfirmLabel;
  final String cancelLabelOverride;
}
