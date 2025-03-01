import 'package:flutter/material.dart';

// Define your custom themes
class AppThemes {
  // Light theme with dark grey scaffold background
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor:
        Colors.white70, // Dark grey for light mode (~#424242)
    primaryColor: Colors.teal, // Primary color for buttons, app bar, etc.
    colorScheme: ColorScheme.light(
      primary: Colors.teal,
      secondary: Colors.tealAccent,
      surface: Colors.grey[200]!, // Surface for cards, dialogs, etc.
      onPrimary: Colors.white, // Text/icon color on primary
      onSurface: Colors.black87, // Text/icon color on surface
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white, // Text/icons on app bar
      elevation: 4,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
      headlineSmall: TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal, // Button background
        foregroundColor: Colors.white, // Button text/icon
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.grey[200],
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor:
        Colors.grey[900], // Near-black for dark mode (~#212121)
    primaryColor: Colors.tealAccent,
    colorScheme: ColorScheme.dark(
      primary: Colors.tealAccent,
      secondary: Colors.teal,
      surface: Colors.grey[850]!, // Surface for cards, dialogs, etc.
      onPrimary: Colors.black87, // Text/icon color on primary
      onSurface: Colors.white70, // Text/icon color on surface
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.tealAccent,
      foregroundColor: Colors.black87,
      elevation: 4,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white70, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white60, fontSize: 14),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.grey[850],
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
