// lib/utils/themes.dart
import 'package:flutter/material.dart';

// Warna untuk Light Theme
const Color primaryLight = Color(0xFF004D40);
const Color accentLight = Color(0xFF80CBC4);

// Warna untuk Dark Theme
const Color primaryDark = Color(0xFF4DB6AC);
const Color accentDark = Color(0xFF00796B);
const Color backgroundDark = Color(0xFF1C1C1E);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Poppins',
  colorScheme: const ColorScheme.light(
    primary: primaryLight,
    secondary: accentLight,
    background: Color(0xFFF5F5F5),
    surface: Colors.white,
    onPrimary: Colors.white,
  ),
  scaffoldBackgroundColor: const Color(0xFFF5F5F5),
  cardColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryLight,
    foregroundColor: Colors.white,
    elevation: 4,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Poppins',
  colorScheme: const ColorScheme.dark(
    primary: primaryDark,
    secondary: accentDark,
    background: backgroundDark,
    surface: Color(0xFF2C2C2E),
    onPrimary: Colors.black,
  ),
  scaffoldBackgroundColor: backgroundDark,
  cardColor: const Color(0xFF2C2C2E),
  appBarTheme: const AppBarTheme(
    backgroundColor: backgroundDark,
    foregroundColor: primaryDark,
    elevation: 0,
  ),
);