import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../shared/design_system/app_breakpoints.dart';
import '../../shared/design_system/app_screen_size_class.dart';

extension BuildContextResponsiveX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  bool get isKeyboardOpen => viewInsets.bottom > 0;

  AppScreenSizeClass get widthSizeClass {
    if (screenWidth < AppBreakpoints.compact) {
      return AppScreenSizeClass.compact;
    }

    if (screenWidth < AppBreakpoints.medium) {
      return AppScreenSizeClass.medium;
    }

    return AppScreenSizeClass.expanded;
  }

  bool get isCompactWidth => widthSizeClass == AppScreenSizeClass.compact;
  bool get isMediumWidth => widthSizeClass == AppScreenSizeClass.medium;
  bool get isExpandedWidth => widthSizeClass == AppScreenSizeClass.expanded;

  void unfocus() => FocusScope.of(this).unfocus();
}
