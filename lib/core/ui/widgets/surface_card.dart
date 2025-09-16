import 'package:flutter/material.dart';
import 'package:global_sos/core/util/border_radii_util.dart';
import 'package:global_sos/core/util/context_util.dart';
import 'package:global_sos/core/util/spacing_util.dart';

/// A reusable and interactive card component for the home screen.
///
/// Combines a [Card] for elevation and shape with an [InkWell] for
/// tap functionality and a Material Design ripple effect.
class SurfaceCard extends StatelessWidget {
  const SurfaceCard({
    super.key,
    this.onTap,
    this.backgroundColor,
    this.child,
    this.elevation = 2.0,
    this.padding = const EdgeInsets.symmetric(
      vertical: Spacing.s16,
      horizontal: Spacing.s20,
    ),
  });

  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Widget? child;
  final double elevation;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? context.colorScheme.primary,
      elevation: elevation,
      // This ensures the InkWell's ripple effect is clipped
      // to the card's rounded corners and doesn't spill outside.
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadii.large),
      child: InkWell(
        onTap: onTap,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
