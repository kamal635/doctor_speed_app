import 'package:doctor_speed_app/core/extensions/build_context_theme_x.dart';
import 'package:flutter/material.dart';

import 'app_loading_indicator.dart';

class AppInlineLoading extends StatelessWidget {
  const AppInlineLoading({
    super.key,
    this.message,
    this.spacing = 12,
    this.padding = const EdgeInsets.all(16),
  });

  final String? message;
  final double spacing;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppLoadingIndicator(),
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
