import 'package:doctor_speed_app/core/extensions/build_context_theme_x.dart';
import 'package:flutter/material.dart';

enum AppButtonVariant { primary, secondary, destructive }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isExpanded = true,
    this.isEnabled = true,
    this.variant = AppButtonVariant.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isExpanded;
  final bool isEnabled;
  final AppButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    final (backgroundColor, foregroundColor) = switch (variant) {
      AppButtonVariant.primary => (colorScheme.primary, colorScheme.onPrimary),

      AppButtonVariant.secondary => (
        colorScheme.secondary,
        colorScheme.onSecondary,
      ),

      AppButtonVariant.destructive => (colorScheme.error, colorScheme.onError),
    };

    final button = FilledButton(
      onPressed: isEnabled ? onPressed : null,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[icon!, const SizedBox(width: 8)],
          Text(label),
        ],
      ),
    );

    if (!isExpanded) {
      return button;
    }

    return SizedBox(width: double.infinity, child: button);
  }
}
