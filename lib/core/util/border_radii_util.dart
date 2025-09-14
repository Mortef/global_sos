import 'package:flutter/material.dart';

/// A utility class that defines common border radii used throughout the app.
///
/// This approach centralizes the border radius definitions, making it easy to
/// maintain consistent styling across different widgets. Using static constants
/// ensures that these values are compile-time constants and cannot be changed.
abstract final class BorderRadii {
  static const double _small = 8.0;
  static const double _medium = 16.0;
  static const double _large = 30.0;

  static BorderRadius small = BorderRadius.circular(_small);
  static BorderRadius medium = BorderRadius.circular(_medium);
  static BorderRadius large = BorderRadius.circular(_large);
}
