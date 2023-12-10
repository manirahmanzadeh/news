import 'package:flutter/material.dart';

mixin AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        fontFamily: 'Muli',
        primaryColor: const Color(0xFF363636),
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
        appBarTheme: appBarTheme(),
        iconTheme: const IconThemeData(
          color: Color(0xFF363636),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displayMedium: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displaySmall: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headlineMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
          ),
          bodyMedium: TextStyle(
            fontSize: 14.0,
            color: Colors.black54,
          ),
        ),
      );

  static AppBarTheme appBarTheme() {
    return const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
      titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    );
  }
}
