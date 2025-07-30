import 'package:flutter/material.dart';

/// A convenience extension on [BuildContext] for cleaner access to the theme.
extension ThemeExt on BuildContext {
  /// Provides simple access to the theme within the widget tree.
  ///
  /// Example: `color: context.theme.colorScheme.surface`
  ThemeData get theme => Theme.of(this);
}
