import 'package:flutter/widgets.dart';
import 'package:global_sos/core/providers/global_providers.dart';
import 'package:global_sos/l10n/app_localizations.dart';
import 'package:global_sos/main.dart';

// Re-export for convenient access to the AppLocalizations class elsewhere.
export 'package:global_sos/l10n/app_localizations.dart';

/// A self-contained utility class for handling app localization.
final class AppLocale {
  // Private constructor to prevent anyone from instantiating this class.
  AppLocale._();

  /// The default locale to use when no match is found.
  static const _fallbackLocale = Locale('en');

  /// Provides global access to the `AppLocalizations` instance.
  ///
  /// **Use this ONLY outside of the widget tree** (e.g., in controllers,
  /// services, or view models). Inside a widget, always prefer `context.l10n`.
  static AppLocalizations get instance {
    final context = providerContainer.read(navigatorKeyProvider).currentContext;

    if (context == null) {
      throw StateError(
        'AppLocale.instance was called without a valid context. '
        'Ensure the navigatorKey is attached to your MaterialApp.',
      );
    }

    return AppLocalizations.of(context)!;
  }

  /// The resolution callback used by MaterialApp to select a locale.
  static Locale? resolveLocale(
    Locale? deviceLocale,
    Iterable<Locale> supported,
  ) {
    if (deviceLocale == null) return _fallbackLocale;
    for (final locale in supported) {
      if (locale.languageCode == deviceLocale.languageCode) {
        return locale; // Match found
      }
    }
    return _fallbackLocale; // No match found, use fallback
  }
}

/// A convenience extension on [BuildContext] for cleaner access to localizations.
extension LocalizationExt on BuildContext {
  /// Provides simple access to localized strings within the widget tree.
  ///
  /// Example: `Text(context.l10n.appTitle)`
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
