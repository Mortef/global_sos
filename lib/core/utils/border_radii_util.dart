import 'package:flutter/material.dart';

/// A utility class that defines common border radii used throughout the app.
abstract final class BorderRadii {
  static const double _small = 12.0;
  static const double _medium = 25.0;
  static const double _large = 50.0;

  static BorderRadius small = BorderRadius.circular(_small);
  static BorderRadius medium = BorderRadius.circular(_medium);
  static BorderRadius large = BorderRadius.circular(_large);
}
