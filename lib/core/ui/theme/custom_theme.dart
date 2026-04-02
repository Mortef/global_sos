import 'package:flutter/material.dart';
import 'package:global_sos/core/ui/theme/app_palette.dart';

/// A class to hold the application's theme data.
///
/// This class centralizes the theme configuration, making it easy to
/// maintain and update the app's visual style.
final class CustomTheme {
  CustomTheme._(); // Prevents instantiation

  static final _colorScheme = ColorScheme(
    brightness: Brightness.dark,
    surface: AppPalette.surface,
    onSurface: AppPalette.onSurface,
    primary: AppPalette.primary,
    onPrimary: AppPalette.onPrimary,
    secondary: AppPalette.secondary,
    onSecondary: AppPalette.onSecondary,
    error: AppPalette.error,
    onError: AppPalette.onError,
  );

  /// Dark theme configuration
  static final dark = ThemeData(colorScheme: _colorScheme);
}
