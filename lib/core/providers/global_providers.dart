import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Provides a singleton [GlobalKey] for the app's navigator.
/// This allows for navigation and context access from outside the widget tree.
part 'global_providers.g.dart';

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> navigatorKey(Ref ref) => GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GlobalKey<ScaffoldMessengerState> messengerKey(Ref ref) =>
    GlobalKey<ScaffoldMessengerState>();
