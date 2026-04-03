import 'package:doctor_speed_app/core/extensions/build_context_responsive_x.dart';
import 'package:doctor_speed_app/shared/design_system/app_breakpoints.dart';
import 'package:flutter/widgets.dart';

import '../design_system/app_spacing.dart';

class AppScreenPadding extends StatelessWidget {
  const AppScreenPadding({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  static EdgeInsets resolve(BuildContext context) {
    final width = context.windowWidth;

    if (width >= AppBreakpoints.large) {
      return const EdgeInsets.symmetric(
        horizontal: AppSpacing.s32,
        vertical: AppSpacing.s16,
      );
    }

    if (width >= AppBreakpoints.compact) {
      return const EdgeInsets.symmetric(
        horizontal: AppSpacing.s24,
        vertical: AppSpacing.s16,
      );
    }

    return const EdgeInsets.symmetric(
      horizontal: AppSpacing.s16,
      vertical: AppSpacing.s16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding ?? resolve(context), child: child);
  }
}
