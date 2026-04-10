import 'package:flutter/animation.dart';

abstract final class AppCurves {
  /// General UI animations.
  static const Curve standard = Curves.easeInOut;

  /// Emphasized transitions.
  static const Curve emphasized = Curves.fastOutSlowIn;

  /// Enter animations.
  static const Curve enter = Curves.easeOut;

  /// Exit animations.
  static const Curve exit = Curves.easeIn;

  /// Button animations.
  static const Curve button = Curves.easeOut;

  /// Bottom sheet animations.
  static const Curve sheet = Curves.easeOutCubic;

  /// Dialog animations.
  static const Curve dialog = Curves.easeOut;
}
