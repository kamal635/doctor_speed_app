import 'package:flutter/material.dart';

class AppLinearLoading extends StatelessWidget {
  const AppLinearLoading({super.key, this.minHeight = 4, this.value});

  final double minHeight;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(minHeight: minHeight, value: value);
  }
}
