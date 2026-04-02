import 'package:flutter/material.dart';
import 'package:global_sos/l10n/app_localizations.dart';

/// ----------------------------------------------------------------------
/// LOCALIZATION
/// ----------------------------------------------------------------------
extension LocalizationContextExt on BuildContext {
  /// Provides boilerplate-free access to generated localized strings.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
