import 'package:flutter/animation.dart';

abstract final class AppCurves {
  static const Curve standard = Curves.easeInOut;
  static const Curve emphasized = Curves.fastOutSlowIn;

  static const Curve enter = Curves.easeOut;
  static const Curve exit = Curves.easeIn;

  static const Curve button = Curves.easeOut;
  static const Curve sheet = Curves.easeOutCubic;
  static const Curve dialog = Curves.easeOut;
}
