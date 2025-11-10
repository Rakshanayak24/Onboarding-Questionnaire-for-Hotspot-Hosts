import 'package:flutter/material.dart';
class AppTheme {
  static const primary = Color(0xFF48E5C2);
  static ThemeData get lightTheme => ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: const Color(0xFF0A0A0A),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
    useMaterial3: true,
  );
}
