import 'package:flutter/material.dart';
import 'package:global_sos/core/ui/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}
