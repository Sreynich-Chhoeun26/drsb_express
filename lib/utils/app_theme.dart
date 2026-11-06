import 'package:flutter/material.dart';

class AppTheme {
  // Dark Mode Background Gradient
  static const BoxDecoration darkBackground = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF1E1B4B), // indigo-950
        Color(0xFF581C87), // purple-900
        Color(0xFF0F172A), // slate-900
      ],
    ),
  );

  // Light Mode Background Gradient
  static const BoxDecoration lightBackground = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFEFF6FF), // blue-50
        Color(0xFFEEF2FF), // indigo-50
        Color(0xFFFAF5FF), // purple-50
      ],
    ),
  );

  static const Color textMutedDark = Color(0xFFC7D2FE); // indigo-200
  static const Color textMutedLight = Color(0xFF64748B); // slate-500
}