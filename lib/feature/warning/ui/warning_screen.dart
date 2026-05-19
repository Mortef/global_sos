import 'package:flutter/material.dart';
import 'package:global_sos/core/ui/widgets/info_screen.dart';
import 'package:global_sos/core/utils/context_utils.dart';
import 'package:global_sos/feature/warning/state/warning_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Warning screen shown to users once during first boot.
class WarningScreen extends ConsumerWidget {
  const WarningScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(warningControllerProvider.notifier);

    return InfoScreen(
      icon: Icons.info,
      title: context.l10n.warningScreenTitle,
      description: context.l10n.warningScreenDescription,
      filledButton: (
        text: context.l10n.warningScreenButtonText,
        onPressed: notifier.acknowledgeWarning,
      ),
    );
  }
}
