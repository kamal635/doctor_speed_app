import 'package:doctor_speed_app/shared/design_system/app_spacing.dart';
import 'package:flutter/material.dart';

class AppLinearLoading extends StatelessWidget {
  const AppLinearLoading({
    super.key,
    this.minHeight = AppSpacing.s4,
    this.value,
  });

  final double minHeight;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(minHeight: minHeight, value: value);
  }
}
