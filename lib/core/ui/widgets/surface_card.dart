import 'package:flutter/material.dart';
import 'package:global_sos/core/utils/border_radii_util.dart';
import 'package:global_sos/core/utils/context_utils.dart';

class SurfaceCard extends StatelessWidget {
  const SurfaceCard({
    super.key,
    this.onTap,
    this.child,
    this.elevation,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
  });

  final VoidCallback? onTap;
  final Widget? child;
  final double? elevation;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: context.colors.surfaceContainer,
      elevation: elevation,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadii.large),
      child: InkWell(
        onTap: onTap,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
