import 'package:flutter/widgets.dart';

import 'app_screen_padding.dart';

class AppSafeAreaPage extends StatelessWidget {
  const AppSafeAreaPage({
    super.key,
    required this.child,
    this.top = true,
    this.bottom = true,
    this.left = true,
    this.right = true,
    this.applyScreenPadding = true,
    this.padding,
  });

  final Widget child;
  final bool top;
  final bool bottom;
  final bool left;
  final bool right;
  final bool applyScreenPadding;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    Widget current = child;

    if (applyScreenPadding) {
      current = AppScreenPadding(padding: padding, child: current);
    }

    return SafeArea(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: current,
    );
  }
}
