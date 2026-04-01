import 'package:flutter/widgets.dart';

import '../../shared/design_system/app_breakpoints.dart';
import '../../shared/design_system/app_window_size_class.dart';

extension BuildContextResponsiveXs on BuildContext {
  Size get windowSize => MediaQuery.sizeOf(this);

  double get windowWidth => windowSize.width;

  AppWindowWidthSizeClass get widthSizeClass {
    if (windowWidth < AppBreakpoints.compact) {
      return AppWindowWidthSizeClass.compact;
    }

    if (windowWidth < AppBreakpoints.medium) {
      return AppWindowWidthSizeClass.medium;
    }

    return AppWindowWidthSizeClass.expanded;
  }

  bool get isCompactWidth => widthSizeClass == AppWindowWidthSizeClass.compact;

  bool get isMediumWidth => widthSizeClass == AppWindowWidthSizeClass.medium;

  bool get isExpandedWidth =>
      widthSizeClass == AppWindowWidthSizeClass.expanded;
}
