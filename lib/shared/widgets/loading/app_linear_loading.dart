import 'package:doctor_speed_app/core/extensions/build_context_theme_x.dart';
import 'package:doctor_speed_app/shared/design_system/app_spacing.dart';
import 'package:flutter/material.dart';

class AppLinearLoading extends StatelessWidget {
  const AppLinearLoading({
    super.key,
    this.minHeight = AppSpacing.s4,
    this.value,
    this.message,
    this.spacing = AppSpacing.s12,
    this.padding = const EdgeInsets.all(AppSpacing.s16),
  });

  final double minHeight;
  final double? value;
  final String? message;
  final double spacing;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: Column(
          children: [
            LinearProgressIndicator(minHeight: minHeight, value: value),

            if (message != null) ...[
              SizedBox(height: spacing),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
