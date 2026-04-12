import 'package:flutter/material.dart';

import '../../shared/design_system/app_colors.dart';
import '../../shared/design_system/app_radius.dart';
import '../../shared/design_system/app_spacing.dart';
import '../../shared/design_system/app_typography.dart';

abstract final class AppTheme {
  static ThemeData get light => _buildLightTheme();
  static ThemeData get dark => _buildDarkTheme();

  static ThemeData _buildLightTheme() {
    const scaffoldBackground = AppColors.neutral100;
    const surface = AppColors.white;
    const textPrimary = AppColors.neutral900;
    const textSecondary = AppColors.neutral700;
    const textTertiary = AppColors.neutral500;
    const border = AppColors.neutral200;

    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ).copyWith(
          primary: AppColors.primary,
          onPrimary: AppColors.white,
          secondary: AppColors.secondary,
          onSecondary: AppColors.white,
          surface: surface,
          onSurface: textPrimary,
          error: AppColors.error,
          onError: AppColors.white,
          outline: border,
        );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      textTheme: _textTheme(
        textPrimary: textPrimary,
        textSecondary: textSecondary,
        textTertiary: textTertiary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBackground,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.heading3.copyWith(color: textPrimary),
      ),
      dividerColor: border,
      inputDecorationTheme: _inputDecorationTheme(
        fillColor: AppColors.neutral50,
        textPrimary: textPrimary,
        textSecondary: textSecondary,
        borderColor: border,
        focusedBorderColor: AppColors.primary,
        errorColor: AppColors.error,
      ),
      elevatedButtonTheme: _elevatedButtonTheme(colorScheme),
      filledButtonTheme: _filledButtonTheme(colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme),
      textButtonTheme: _textButtonTheme(colorScheme),
      cardTheme: const CardThemeData(
        color: surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.radiusLg),
      ),
    );
  }

  static ThemeData _buildDarkTheme() {
    const scaffoldBackground = AppColors.neutral900;
    const surface = AppColors.neutral800;
    const textPrimary = AppColors.white;
    const textSecondary = AppColors.neutral300;
    const textTertiary = AppColors.neutral400;
    const border = AppColors.neutral700;

    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
        ).copyWith(
          primary: AppColors.primaryLight,
          onPrimary: AppColors.white,
          secondary: AppColors.secondaryLight,
          onSecondary: AppColors.black,
          surface: surface,
          onSurface: textPrimary,
          error: AppColors.error,
          onError: AppColors.white,
          outline: border,
        );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      textTheme: _textTheme(
        textPrimary: textPrimary,
        textSecondary: textSecondary,
        textTertiary: textTertiary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBackground,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.heading3.copyWith(color: textPrimary),
      ),
      dividerColor: border,
      inputDecorationTheme: _inputDecorationTheme(
        fillColor: AppColors.neutral800,
        textPrimary: textPrimary,
        textSecondary: textSecondary,
        borderColor: border,
        focusedBorderColor: AppColors.primaryLight,
        errorColor: AppColors.error,
      ),
      elevatedButtonTheme: _elevatedButtonTheme(colorScheme),
      filledButtonTheme: _filledButtonTheme(colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(colorScheme),
      textButtonTheme: _textButtonTheme(colorScheme),
      cardTheme: const CardThemeData(
        color: surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.radiusLg),
      ),
    );
  }

  static TextTheme _textTheme({
    required Color textPrimary,
    required Color textSecondary,
    required Color textTertiary,
  }) {
    return TextTheme(
      displayLarge: AppTypography.displayLarge.copyWith(color: textPrimary),
      headlineLarge: AppTypography.heading1.copyWith(color: textPrimary),
      headlineMedium: AppTypography.heading2.copyWith(color: textPrimary),
      titleLarge: AppTypography.heading3.copyWith(color: textPrimary),
      titleMedium: AppTypography.title.copyWith(color: textPrimary),
      bodyLarge: AppTypography.bodyLarge.copyWith(color: textSecondary),
      bodyMedium: AppTypography.bodyMedium.copyWith(color: textSecondary),
      bodySmall: AppTypography.bodySmall.copyWith(color: textSecondary),
      labelLarge: AppTypography.labelLarge.copyWith(color: textPrimary),
      labelMedium: AppTypography.labelMedium.copyWith(color: textSecondary),
      labelSmall: AppTypography.caption.copyWith(color: textTertiary),
    );
  }

  static InputDecorationTheme _inputDecorationTheme({
    required Color fillColor,
    required Color textPrimary,
    required Color textSecondary,
    required Color borderColor,
    required Color focusedBorderColor,
    required Color errorColor,
  }) {
    OutlineInputBorder border(Color color) {
      return OutlineInputBorder(
        borderRadius: AppRadius.radiusMd,
        borderSide: BorderSide(color: color),
      );
    }

    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s16,
        vertical: AppSpacing.s16,
      ),
      hintStyle: AppTypography.bodyMedium.copyWith(color: textSecondary),
      labelStyle: AppTypography.bodyMedium.copyWith(color: textSecondary),
      errorStyle: AppTypography.bodySmall.copyWith(color: errorColor),
      border: border(borderColor),
      enabledBorder: border(borderColor),
      focusedBorder: border(focusedBorderColor),
      errorBorder: border(errorColor),
      focusedErrorBorder: border(errorColor),
    );
  }

  static FilledButtonThemeData _filledButtonTheme(ColorScheme colorScheme) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        elevation: 0,

        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s24,
          vertical: AppSpacing.s16,
        ),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        textStyle: AppTypography.button,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.radiusMd),
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s24,
          vertical: AppSpacing.s16,
        ),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        textStyle: AppTypography.button,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.radiusMd),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        // minimumSize: const Size.fromHeight(52),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s24,
          vertical: AppSpacing.s16,
        ),
        foregroundColor: colorScheme.primary,
        textStyle: AppTypography.labelLarge.copyWith(
          color: colorScheme.primary,
        ),
        side: BorderSide(color: colorScheme.outline),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.radiusMd),
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.primary,
        textStyle: AppTypography.labelLarge.copyWith(
          color: colorScheme.primary,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s12,
          vertical: AppSpacing.s8,
        ),
      ),
    );
  }
}
