import 'package:flutter/material.dart';
import 'package:global_sos/core/utils/context_utils.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      style: IconButton.styleFrom(
        backgroundColor: context.colors.surfaceContainerHigh,
        foregroundColor: context.colors.onSurfaceVariant,
      ),
    );
  }
}
