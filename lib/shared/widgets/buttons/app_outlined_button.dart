import 'package:doctor_speed_app/shared/design_system/app_gaps.dart';
import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isExpanded = true,
    this.isEnabled = true,
    this.foregroundColor,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isExpanded;
  final bool isEnabled;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton(
      style: OutlinedButton.styleFrom(foregroundColor: foregroundColor),
      onPressed: isEnabled ? onPressed : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[icon!, AppGaps.w8],
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
