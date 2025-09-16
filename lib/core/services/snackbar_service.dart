import 'package:flutter/material.dart';
import 'package:global_sos/core/providers/global_providers.dart';
import 'package:global_sos/l10n/app_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'snackbar_service.g.dart';

/// A Riverpod provider for the SnackbarService.
/// This makes the service available throughout the app in an idiomatic way.
@Riverpod(keepAlive: true)
SnackbarService snackbarService(Ref ref) {
  // The service depends on the navigator and messenger keys.
  // Riverpod injects them here.
  final navigatorKey = ref.watch(navigatorKeyProvider);
  final messengerKey = ref.watch(messengerKeyProvider);
  return SnackbarService(navigatorKey, messengerKey);
}

/// A service class to manage SnackBars without needing BuildContext.
class SnackbarService {
  // Dependencies are injected via the constructor.
  SnackbarService(this._navigatorKey, this._messengerKey);

  final GlobalKey<NavigatorState> _navigatorKey;
  final GlobalKey<ScaffoldMessengerState> _messengerKey;

  // Helper to get the current context from the navigator key.
  BuildContext? get _context => _navigatorKey.currentContext;

  // Helper to get the AppLocalizations instance.
  AppLocalizations? get _l10n {
    return _context != null ? AppLocalizations.of(_context!) : null;
  }

  /// Shows a SnackBar using a message builder for localization.
  void showSnackbar(
    String Function(AppLocalizations l10n) messageBuilder, {
    Color? backgroundColor,
  }) {
    // Check if the messenger is available and we can get translations.
    if (_messengerKey.currentState != null && _l10n != null) {
      final message = messageBuilder(_l10n!);
      final snackBar = SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
      );

      _messengerKey.currentState!
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }
}
