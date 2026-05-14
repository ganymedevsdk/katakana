import 'package:flutter/material.dart';

class AppTheme {
  static const _primaryTeal = Color(0xFF1A8E8F);
  static const _darkTeal = Color(0xFF0D5D5F);
  static const _accentOrange = Color(0xFFB84815);

  static final ColorScheme _lightScheme = ColorScheme.fromSeed(
    seedColor: _primaryTeal,
    primary: _primaryTeal,
    secondary: _accentOrange,
    tertiary: _darkTeal,
    brightness: Brightness.light,
  );

  static final ColorScheme _darkScheme = ColorScheme.fromSeed(
    seedColor: _primaryTeal,
    primary: _primaryTeal,
    secondary: _accentOrange,
    tertiary: _darkTeal,
    brightness: Brightness.dark,
  );

  static ThemeData light() => ThemeData(
        useMaterial3: true,
        colorScheme: _lightScheme,
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: _lightScheme.primary,
          foregroundColor: _lightScheme.onPrimary,
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );

  static ThemeData dark() => ThemeData(
        useMaterial3: true,
        colorScheme: _darkScheme,
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: _darkScheme.surface,
          foregroundColor: _darkScheme.onSurface,
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );
}
