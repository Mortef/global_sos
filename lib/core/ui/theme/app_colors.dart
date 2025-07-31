import 'package:flutter/material.dart';

/// A class to hold the application's color palette.
///
/// This approach centralizes color definitions, making them easy to manage
/// and reuse throughout the app. Using static const ensures that these
/// values are compile-time constants and cannot be changed.
final class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // --- Neutral & Primary Palette --- //
  // Defines the main surface and button colors for the dark theme.
  static const Color surface = Color(0xFF121212);
  static const Color primary = Color(0xFF2C2C2E);
  static const Color secondary = Color(0xFF2C2C2E);
  static const Color error = Color(0xFFF2B8B5);

  // --- "On" Colors (for text and icons) --- //
  static const Color onSurface = Color(0xFFFFFFFF);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onError = Color(0xFF601410);

  // --- Feature/Button Colors --- //
  static const Color buttonBlue = Color(0xFF004080);
  static const Color buttonGreen = Color(0xFF1E5631);
  static const Color buttonRed = Color(0xFF8B0000);
  static const Color textLink = Color(0xFF097DF1);
  static const Color countryWidgetKickerColor = Color(0xFFBDBDBD);
}
