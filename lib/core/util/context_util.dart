import 'package:flutter/material.dart';

/// Provides convenient shortcuts for theme properties and UI actions on [BuildContext].
extension ContextExt on BuildContext {
  ThemeData get _theme => Theme.of(this);

  /// Shortcut for `Theme.of(context).textTheme`.
  TextTheme get textTheme => _theme.textTheme;

  /// Shortcut for `Theme.of(context).colorScheme`.
  ColorScheme get colorScheme => _theme.colorScheme;

  /// Displays a simple [SnackBar] with the given [text].
  void showSnackBar(String text) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(text)));
  }
}
