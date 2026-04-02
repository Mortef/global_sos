import 'dart:ui';

/// A class to hold the application's color palette.
///
/// This approach centralizes color definitions, making them easy to manage
/// and reuse throughout the app. Using static const ensures that these
/// values are compile-time constants and cannot be changed.
final class AppPalette {
  AppPalette._(); //Prevents instantiation

  // --- Primary Palette --- //
  // Defines the main surface and button colors for the dark theme.
  static const Color surface = Color(0xFF0E141A);
  static const Color primary = Color(0xFF56D7E9);
  static const Color secondary = Color(0xFF94CCFF);
  static const Color error = Color(0xFFFFB4AB);

  // --- "On" Colors (for text and icons) --- //
  static const Color onSurface = Color(0xFFDDE3EB);
  static const Color onPrimary = Color(0xFF003339);
  static const Color onSecondary = Color(0xFF003339);
  static const Color onError = Color(0xFF000000);

  // --- Icon Colors ---
  static const Color policeIcon = Color(0xFF94CCFF);
  static const Color ambulanceIcon = Color(0xFF48BB78);
  static const Color fireIcon = Color(0xFFF56565);
}
