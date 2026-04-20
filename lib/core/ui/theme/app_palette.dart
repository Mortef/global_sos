import 'dart:ui';

/// A class to hold the application's color palette.
///
/// This approach centralizes color definitions, making them easy to manage
/// and reuse throughout the app. Using static const ensures that these
/// values are compile-time constants and cannot be changed.
final class AppPalette {
  // --- Surface Colors --- //
  static const Color surface = Color(0xFF11171D);
  static const Color surfaceContainerLowest = Color(0xFF090F14);
  static const Color surfaceContainerLow = Color(0xFF161C22);
  static const Color surfaceContainer = Color(0xFF1A2026);
  static const Color surfaceContainerHigh = Color(0xFF252B31);
  static const Color surfaceContainerHighest = Color(0xFF2F353C);
  static const Color surfaceBright = Color(0xFF3D4947);
  static const Color onSurface = Color(0xFFDDE3EB);
  static const Color onSurfaceVariant = Color(0xFF98A4A3);

  // --- Primary Colors --- //
  static const Color primary = Color(0xFF56D7E9);
  static const Color onPrimary = Color(0xFF003339);

  // --- Secondary Colors --- //
  static const Color secondary = Color(0xFF94CCFF);
  static const Color onSecondary = Color(0xFF003339);

  // --- Error Colors --- //
  static const Color error = Color(0xFFFFB4AB);
  static const Color onError = Color(0xFF000000);

  // --- Icon Colors ---
  static const Color policeIcon = Color(0xFF94CCFF);
  static const Color ambulanceIcon = Color(0xFF48BB78);
  static const Color fireIcon = Color(0xFFF56565);
}
