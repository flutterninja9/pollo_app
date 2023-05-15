import 'package:flutter/material.dart';
import 'package:pollo_education/design_system/r.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: R.color.primary,
      onPrimary: R.color.onPrimary,
      secondary: R.color.secondary,
      onSecondary: R.color.onSecondary,
      error: R.color.error,
      onError: R.color.onError,
      background: R.color.background,
      onBackground: R.color.onBackground,
      surface: R.color.surface,
      onSurface: R.color.onSurface,
    ),
    fontFamily: R.constant.fontFamily,
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: R.color.background,
      selectedItemColor: R.color.primary,
      unselectedItemColor: R.color.onBackground,
      enableFeedback: true,
      elevation: 10,
    ),
  );

  static final ThemeData dark = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: R.color.primary,
      onPrimary: R.color.onPrimary,
      secondary: R.color.secondary,
      onSecondary: R.color.onBackground,
      error: R.color.error,
      onError: R.color.onError,
      background: R.color.onBackground,
      onBackground: R.color.background,
      surface: R.color.onSurface,
      onSurface: R.color.surface,
    ),
    fontFamily: R.constant.fontFamily,
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: R.color.background,
      selectedItemColor: R.color.primary,
      unselectedItemColor: R.color.background,
      enableFeedback: true,
    ),
  );
}
