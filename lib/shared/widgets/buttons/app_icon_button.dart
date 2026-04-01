import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.isEnabled = true,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: isEnabled ? onPressed : null,
      tooltip: tooltip,
      icon: icon,
    );
  }
}
