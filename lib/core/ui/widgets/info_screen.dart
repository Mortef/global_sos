import 'package:flutter/material.dart';
import 'package:global_sos/core/utils/context_utils.dart';

/// Defines the visual styling for the actions in the [InfoScreen].
enum ButtonType { filled, outlined, text }

/// A reusable info screen that can be used for various purposes, such as the
/// warning screen and the location permission screen.
///
/// It consists of an icon, a title, a description, and up to three buttons.
/// Buttons will only be rendered if their corresponding record is provided.
class InfoScreen extends StatelessWidget {
  const InfoScreen({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.filledButton,
    this.outlinedButton,
    this.textButton,
  });

  final IconData icon;
  final String title;
  final String description;
  final ({String text, VoidCallback onPressed}) filledButton;
  final ({String text, VoidCallback onPressed})? outlinedButton;
  final ({String text, VoidCallback onPressed})? textButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverSafeArea(
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 24,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _HaloIcon(icon: icon),
                          const SizedBox(height: 48),
                          _Title(title: title),
                          const SizedBox(height: 16),
                          _Description(description: description),
                          const SizedBox(height: 48),
                          // Primary Action Button (Filled)
                          _Button(
                            type: ButtonType.filled,
                            buttonText: filledButton.text,
                            onPressed: filledButton.onPressed,
                          ),
                          // Secondary Action Button (Outlined)
                          if (outlinedButton != null) ...[
                            const SizedBox(height: 16),
                            _Button(
                              type: ButtonType.outlined,
                              // Safe to use '!' because of the outlinedButton condition.
                              buttonText: outlinedButton!.text,
                              onPressed: outlinedButton!.onPressed,
                            ),
                          ],
                          // Tertiary Action Button (Text)
                          if (textButton != null) ...[
                            const SizedBox(height: 16),
                            _Button(
                              type: ButtonType.text,
                              // Safe to use '!' because of the textButton condition.
                              buttonText: textButton!.text,
                              onPressed: textButton!.onPressed,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Displays the icon with a halo effect around it.
class _HaloIcon extends StatelessWidget {
  const _HaloIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ExcludeSemantics(
        child: Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colors.surfaceContainer,
            boxShadow: [
              BoxShadow(
                color: context.colors.primary.withValues(alpha: 0.15),
                blurRadius: 40,
                spreadRadius: 10,
              ),
            ],
            border: Border.all(
              color: context.colors.primary.withValues(alpha: 0.2),
            ),
          ),
          child: Icon(icon, size: 48, color: context.colors.primary),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: context.typography.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: context.typography.bodyLarge?.copyWith(
        color: context.colors.onSurfaceVariant,
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.type,
    required this.buttonText,
    required this.onPressed,
  });

  final ButtonType type;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.typography.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold,
    );
    const minSize = Size(double.infinity, 54);
    const padding = EdgeInsets.symmetric(vertical: 12, horizontal: 24);

    return switch (type) {
      ButtonType.filled => FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          minimumSize: minSize,
          textStyle: textStyle,
          padding: padding,
        ),
        child: Text(buttonText, textAlign: TextAlign.center),
      ),
      ButtonType.outlined => OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: minSize,
          textStyle: textStyle,
          padding: padding,
        ),
        child: Text(buttonText, textAlign: TextAlign.center),
      ),
      ButtonType.text => TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          minimumSize: minSize,
          textStyle: textStyle,
          padding: padding,
        ),
        child: Text(buttonText, textAlign: TextAlign.center),
      ),
    };
  }
}
