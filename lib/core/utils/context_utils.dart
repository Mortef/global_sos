import 'package:flutter/material.dart';
import 'package:global_sos/l10n/app_localizations.dart';

/// ----------------------------------------------------------------------
/// LOCALIZATION
/// ----------------------------------------------------------------------
extension LocalizationContextExt on BuildContext {
  /// Provides boilerplate-free access to generated localized strings.
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// ----------------------------------------------------------------------
/// MATERIAL 3 THEME & TYPOGRAPHY
/// ----------------------------------------------------------------------
extension ThemeContextExt on BuildContext {
  /// Direct access to the Material 3 ColorScheme.
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Direct access to the Material 3 TextTheme.
  TextTheme get typography => Theme.of(this).textTheme;
}
