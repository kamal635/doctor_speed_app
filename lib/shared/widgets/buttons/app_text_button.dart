import 'package:doctor_speed_app/shared/design_system/app_gaps.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isEnabled = true,
    this.foregroundColor,
    this.padding,
    this.tapTargetSize,
    this.minimumSize,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isEnabled;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final MaterialTapTargetSize? tapTargetSize;
  final Size? minimumSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isEnabled ? onPressed : null,
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
        padding: padding,
        tapTargetSize: tapTargetSize,
        minimumSize: minimumSize,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[icon!, AppGaps.w8],
          Text(label),
        ],
      ),
    );
  }
}
