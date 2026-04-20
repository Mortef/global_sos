import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A utility class that holds predefined constant values for spacing.
abstract final class Spacing {
  static const double tiny = 4.0;
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
}

/// This extension on `double` provides a convenient way to create `SizedBox` widgets
/// for vertical and horizontal spacing.
/// Example:
/// Spacing.medium.vertical, Creates a SizedBox(height: 16.0)
/// Spacing.large.horizontal, Creates a SizedBox(width: 24.0)
extension SpacingSizedBox on double {
  SizedBox get vertical => SizedBox(height: this);
  SizedBox get horizontal => SizedBox(width: this);
}
