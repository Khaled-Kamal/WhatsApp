import 'package:flutter/material.dart';

// WhatsApp-like palette
const _waGreen = Color(0xFF075E54);
const _waTeal = Color(0xFF128C7E);

ThemeData buildLightTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: _waGreen,
    brightness: Brightness.light,
  ).copyWith(
    primary: _waGreen,
    secondary: _waTeal,
    surface: Colors.white,
    background: const Color(0xFFF9F9F9),
  );

  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: _waGreen,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: colorScheme.background,
    inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
    iconTheme: const IconThemeData(color: Colors.white),
    tabBarTheme: const TabBarThemeData(
      labelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
      labelColor: Colors.white,
      unselectedLabelColor: Color(0xFF80CBC4),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 2, color: Colors.white),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _waTeal,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
  );
}

ThemeData buildDarkTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: _waGreen,
    brightness: Brightness.dark,
  ).copyWith(
    primary: _waGreen,
    secondary: _waTeal,
    surface: const Color(0xFF121B22),
    background: const Color(0xFF0B141A),
  );

  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: _waGreen,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: colorScheme.background,
    inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
    iconTheme: const IconThemeData(color: Colors.white),
    tabBarTheme: const TabBarThemeData(
      labelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
      labelColor: Colors.white,
      unselectedLabelColor: Color(0xFF80CBC4),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 2, color: Colors.white),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _waTeal,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
  );
}
