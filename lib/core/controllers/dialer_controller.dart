import 'package:flutter/material.dart';
import 'package:global_sos/core/services/snackbar_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'dialer_controller.g.dart';

@riverpod
class DialerController extends _$DialerController {
  @override
  // No state needed for this controller, so the build method is empty.
  void build() {}

  Future<void> launchDialer(String? phoneNumber) async {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      ref
          .read(snackbarServiceProvider)
          .showSnackbar((l10n) => l10n.phoneNumberNotAvailable);
      return;
    }

    final phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        ref
            .read(snackbarServiceProvider)
            .showSnackbar((l10n) => l10n.dialerError);
      }
    } on Exception catch (e) {
      debugPrint('Failed to launch dialer: $e');
      ref
          .read(snackbarServiceProvider)
          .showSnackbar((l10n) => l10n.dialerError);
    }
  }
}
