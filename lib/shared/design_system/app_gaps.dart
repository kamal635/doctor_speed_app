import 'package:flutter/widgets.dart';

import 'app_spacing.dart';

abstract final class AppGaps {
  static const Widget h4 = SizedBox(height: AppSpacing.s4);
  static const Widget h8 = SizedBox(height: AppSpacing.s8);
  static const Widget h12 = SizedBox(height: AppSpacing.s12);
  static const Widget h16 = SizedBox(height: AppSpacing.s16);
  static const Widget h24 = SizedBox(height: AppSpacing.s24);
  static const Widget h32 = SizedBox(height: AppSpacing.s32);
  static const Widget h40 = SizedBox(height: AppSpacing.s40);
  static const Widget h48 = SizedBox(height: AppSpacing.s48);

  static const Widget w4 = SizedBox(width: AppSpacing.s4);
  static const Widget w8 = SizedBox(width: AppSpacing.s8);
  static const Widget w12 = SizedBox(width: AppSpacing.s12);
  static const Widget w16 = SizedBox(width: AppSpacing.s16);
  static const Widget w24 = SizedBox(width: AppSpacing.s24);
  static const Widget w32 = SizedBox(width: AppSpacing.s32);
  static const Widget w40 = SizedBox(width: AppSpacing.s40);
  static const Widget w48 = SizedBox(width: AppSpacing.s48);
}
