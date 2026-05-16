import 'package:flutter/material.dart';
import 'package:global_sos/core/utils/context_utils.dart';
import 'package:global_sos/feature/warning/state/warning_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Warning screen shown to users once during first boot.
class WarningScreen extends StatelessWidget {
  const WarningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              _HaloInfoIcon(),
              SizedBox(height: 64),
              _WarningTitle(),
              SizedBox(height: 24),
              _WarningDescription(),
              Spacer(),
              _WarningButton(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _HaloInfoIcon extends StatelessWidget {
  const _HaloInfoIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Icon(Icons.info, size: 48, color: context.colors.primary),
    );
  }
}

class _WarningTitle extends StatelessWidget {
  const _WarningTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.warningScreenTitle,
      style: context.typography.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _WarningDescription extends StatelessWidget {
  const _WarningDescription();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.warningScreenDescription,
      textAlign: TextAlign.justify,
      style: context.typography.bodyLarge?.copyWith(
        color: context.colors.onSurfaceVariant,
      ),
    );
  }
}

class _WarningButton extends ConsumerWidget {
  const _WarningButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(warningControllerProvider.notifier);

    return SizedBox(
      width: double.infinity,
      height: 64,
      child: FilledButton(
        onPressed: notifier.acknowledgeWarning,
        child: Text(
          context.l10n.warningScreenButtonText,
          style: context.typography.labelLarge?.copyWith(
            color: context.colors.onPrimary,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
