import 'package:doctor_speed_app/shared/widgets/app_gaps.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isExpanded = true,
    this.isEnabled = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isExpanded;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final button = FilledButton(
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
