import 'package:flutter/material.dart';

ThemeData myAppTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(color: Color(0xFF064663)),
    canvasColor: const Color(0xFF393E46),
    hintColor: const Color(0xFF191919),
    brightness:
        Brightness.light, // Set the overall brightness of the app (light theme)

    textTheme: const TextTheme(
      titleMedium: TextStyle(fontSize: 20, color: Color(0xFF04293A)),
      bodySmall: TextStyle(fontSize: 16, color: Color(0xFF064663)),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFFEEEEEE), // Card background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ), // Card shape
    ),
    inputDecorationTheme: const InputDecorationTheme(
      //border: OutlineInputBorder(), // Border for input fields
      //filled: true, // Fill the input field background
      fillColor: Color(0xFFEEEEEE), // Input field background color
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xFF46B5D1),
      extendedPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF46B5D1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(12),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Color(0xFF1F4287),
    ),
  );
}
