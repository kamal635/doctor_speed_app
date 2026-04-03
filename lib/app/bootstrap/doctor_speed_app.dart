import 'package:doctor_speed_app/core/constants/app_constants.dart';
import 'package:doctor_speed_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../router/app_router.dart';
import '../theme/app_theme.dart';

class DoctorSpeedApp extends StatelessWidget {
  const DoctorSpeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
