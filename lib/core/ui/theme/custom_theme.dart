import 'package:flutter/material.dart';
import 'package:global_sos/core/ui/theme/app_colors.dart';

/// A class to hold the application's theme data.
///
/// This class centralizes the theme configuration, making it easy to
/// maintain and update the app's visual style.
abstract final class CustomTheme {
  static final _colorScheme = ColorScheme(
    brightness: Brightness.dark,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    error: AppColors.error,
    onError: AppColors.onError,
  );

  /// Dark theme configuration
  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: AppColors.surface,
  );
}
