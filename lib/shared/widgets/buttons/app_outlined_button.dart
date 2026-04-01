import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
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
    final button = OutlinedButton(
      onPressed: isEnabled ? onPressed : null,
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
