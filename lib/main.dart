import 'package:flutter/material.dart';
import 'package:global_sos/core/ui/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Create a global container for non-widget access to providers.
final providerContainer = ProviderContainer();

void main() {
  runApp(const ProviderScope(child: App()));
}
