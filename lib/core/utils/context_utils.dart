import 'package:flutter/material.dart';
import 'package:global_sos/l10n/app_localizations.dart';

/// Extension to provide quick access to localized strings.
extension LocalizationContextExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// Extension to provide quick access to theme-related properties.
extension ThemeContextExt on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get typography => Theme.of(this).textTheme;
}
