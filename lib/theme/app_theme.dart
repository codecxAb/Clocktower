import 'package:flutter/material.dart';

class AppTheme {
  // Dark theme colors
  static const Color darkBackground = Color(0xFF0A0A0A);
  static const Color cardBackground = Color(0xFF1A1A1A);
  static const Color glassBackground = Color(0x33FFFFFF);
  static const Color primaryWhite = Color(0xFFFFFFFF);
  static const Color secondaryWhite = Color(0xCCFFFFFF);
  static const Color borderColor = Color(0x33FFFFFF);
  static const Color accentColor = Color(0xFFE0E0E0);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: primaryWhite,
        secondary: secondaryWhite,
        surface: cardBackground,
        background: darkBackground,
        onPrimary: darkBackground,
        onSecondary: darkBackground,
        onSurface: primaryWhite,
        onBackground: primaryWhite,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: primaryWhite,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
        titleMedium: TextStyle(
          color: primaryWhite,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: secondaryWhite,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: secondaryWhite,
          fontSize: 14,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: primaryWhite,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
        iconTheme: IconThemeData(color: primaryWhite),
      ),
      cardTheme: CardThemeData(
        color: cardBackground.withOpacity(0.5),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: borderColor, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: glassBackground,
          foregroundColor: primaryWhite,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: borderColor, width: 1),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: glassBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: borderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryWhite, width: 2),
        ),
        labelStyle: const TextStyle(color: secondaryWhite),
        hintStyle: TextStyle(color: secondaryWhite.withOpacity(0.5)),
      ),
    );
  }
}
