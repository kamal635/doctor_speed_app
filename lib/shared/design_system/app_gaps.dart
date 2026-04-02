import 'package:flutter/widgets.dart';

import 'app_spacing.dart';

abstract final class AppGaps {
  static const Widget h4 = SizedBox(height: AppSpacing.xxs);
  static const Widget h8 = SizedBox(height: AppSpacing.xs);
  static const Widget h12 = SizedBox(height: AppSpacing.sm);
  static const Widget h16 = SizedBox(height: AppSpacing.md);
  static const Widget h24 = SizedBox(height: AppSpacing.lg);
  static const Widget h32 = SizedBox(height: AppSpacing.xl);
  static const Widget h40 = SizedBox(height: AppSpacing.xxl);
  static const Widget h48 = SizedBox(height: AppSpacing.xxxl);

  static const Widget w4 = SizedBox(width: AppSpacing.xxs);
  static const Widget w8 = SizedBox(width: AppSpacing.xs);
  static const Widget w12 = SizedBox(width: AppSpacing.sm);
  static const Widget w16 = SizedBox(width: AppSpacing.md);
  static const Widget w24 = SizedBox(width: AppSpacing.lg);
  static const Widget w32 = SizedBox(width: AppSpacing.xl);
  static const Widget w40 = SizedBox(width: AppSpacing.xxl);
  static const Widget w48 = SizedBox(width: AppSpacing.xxxl);
}
