import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppSkeleton extends StatelessWidget {
  const AppSkeleton({super.key, required this.enabled, required this.child});

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(enabled: enabled, child: child);
  }
}
