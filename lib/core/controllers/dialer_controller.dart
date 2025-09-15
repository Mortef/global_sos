import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/service_libs.dart';

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

    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        ref
            .read(snackbarServiceProvider)
            .showSnackbar((l10n) => l10n.dialerError);
      }
    } catch (e) {
      debugPrint('Failed to launch dialer: $e');
      ref
          .read(snackbarServiceProvider)
          .showSnackbar((l10n) => l10n.dialerError);
    }
  }
}
