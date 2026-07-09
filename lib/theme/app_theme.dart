import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF2E2A4A);
  static const Color secondary = Color(0xFFC9A24B);
  static const Color background = Color(0xFFF7F5F2);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textMuted = Color(0xFF7A7690);

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: secondary,
      surface: surface,
    ),

    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 2,
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primary,
      ),

      bodyMedium: TextStyle(fontSize: 16, color: textMuted),

      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),

      headlineSmall: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),

    iconTheme: const IconThemeData(color: primary),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondary,
      foregroundColor: Colors.white,
    ),
  );
}
