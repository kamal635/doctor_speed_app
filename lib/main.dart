import 'package:flutter/material.dart';

import 'app/theme/app_theme.dart';

void main() {
  runApp(const DoctorSpeedApp());
}

class DoctorSpeedApp extends StatelessWidget {
  const DoctorSpeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Speed',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const Scaffold(body: Center(child: Text('Doctor Speed'))),
    );
  }
}
