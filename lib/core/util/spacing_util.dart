import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A utility class that holds predefined constant values for spacing.
///
/// This helps maintain a consistent design system across the app.
abstract final class Spacing {
  static const double s2 = 2.0;
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s26 = 26.0;
  static const double s32 = 32.0;
  static const double s40 = 40.0;
  static const double s48 = 48.0;
  static const double s64 = 64.0;
  static const double s80 = 80.0;
}

/// This extension on `double` provides a convenient way to create `SizedBox` widgets
/// for vertical and horizontal spacing.
/// Example:
/// Spacing.space16.vertical, Creates a SizedBox(height: 16.0)
/// Spacing.space20.horizontal, Creates a SizedBox(width: 20.0)
extension SpacingSizedBox on double {
  SizedBox get vertical => SizedBox(height: this);
  SizedBox get horizontal => SizedBox(width: this);
}
