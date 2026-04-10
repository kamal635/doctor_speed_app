import 'package:doctor_speed_app/core/extensions/build_context_responsive_x.dart';
import 'package:doctor_speed_app/shared/design_system/app_screen_size_class.dart';
import 'package:flutter/widgets.dart';

import '../design_system/app_spacing.dart';

class AppScreenPadding extends StatelessWidget {
  const AppScreenPadding({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  static EdgeInsets resolve(BuildContext context) {
    final widthSizeClass = context.widthSizeClass;

    switch (widthSizeClass) {
      case AppScreenSizeClass.compact:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s16,
        );
      case AppScreenSizeClass.medium:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.s24,
          vertical: AppSpacing.s16,
        );
      case AppScreenSizeClass.expanded:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.s32,
          vertical: AppSpacing.s16,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding ?? resolve(context), child: child);
  }
}
