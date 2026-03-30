import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

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
      home: Scaffold(
        appBar: AppBar(title: const Text('Doctor Speed')),
        body: Center(
          child: Text(
            'Welcome to Doctor Speed!',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
