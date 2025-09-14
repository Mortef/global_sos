import 'package:flutter/material.dart';

/// A convenience extension on [BuildContext] for cleaner access to the theme.
extension ContextExt on BuildContext {
  /// Provides simple access to the theme within the widget tree.
  ///
  /// Example: `color: context.colorScheme.surface`
  /// Example: `textStyle: context.textTheme.bodyLarge`
  ThemeData get _theme => Theme.of(this);
  TextTheme get textTheme => _theme.textTheme;
  ColorScheme get colorScheme => _theme.colorScheme;
}
