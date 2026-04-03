import 'package:doctor_speed_app/shared/design_system/app_gaps.dart';
import 'package:doctor_speed_app/shared/design_system/app_spacing.dart';
import 'package:flutter/material.dart';

Future<T?> showAppDialog<T>(
  BuildContext context, {
  required Widget child,
  bool barrierDismissible = true,
  bool useRootNavigator = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    useRootNavigator: useRootNavigator,
    builder: (_) => child,
  );
}

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.title,
    this.message,
    this.icon,
    this.content,
    this.actions = const [],
    this.maxWidth = 420,
    this.insetPadding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.s24,
      vertical: AppSpacing.s24,
    ),
  });

  final String title;
  final String? message;
  final Widget? icon;
  final Widget? content;
  final List<Widget> actions;
  final double maxWidth;
  final EdgeInsets insetPadding;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      insetPadding: insetPadding,
      backgroundColor: colorScheme.surface,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.s24),

          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[icon!, AppGaps.h16],

                Text(
                  title,
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),

                if (message != null) ...[
                  AppGaps.h8,
                  Text(
                    message!,
                    style: textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],

                if (content != null) ...[AppGaps.h16, content!],

                if (actions.isNotEmpty) ...[
                  AppGaps.h24,

                  for (int i = 0; i < actions.length; i++) ...[
                    SizedBox(width: double.infinity, child: actions[i]),
                    if (i != actions.length - 1) AppGaps.h12,
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
