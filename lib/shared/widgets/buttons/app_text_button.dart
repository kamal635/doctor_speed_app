import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isEnabled = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
  }
}
