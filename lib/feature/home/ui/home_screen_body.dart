import 'package:flutter/material.dart';
import 'package:global_sos/core/ui/theme/app_colors.dart';
import 'package:global_sos/core/util/context_util.dart';
import 'package:global_sos/core/util/locale_util.dart';
import 'package:global_sos/core/util/spacing_util.dart';
import 'package:global_sos/feature/home/ui/widgets/country_detection_card.dart';
import 'package:global_sos/feature/home/ui/widgets/emergency_contact_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A view that adapts its layout based on the phone's orientation.
///
/// Since only four buttons are currently being displayed,
/// a simple orientation approach with `OrientationBuilder` was used instead of the
/// recommended material 3 layout guidelines (window size classes plus `LayoutBuilder`),
/// which have to deal with three different screen sizes (compact, medium and expanded).
class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.portrait) {
          return _buildPortraitLayout();
        } else {
          return _buildLandscapeLayout(context);
        }
      },
    );
  }

  /// Builds the UI for portrait mode.
  ///
  /// This layout arranges the main elements vertically in a [Column].
  Widget _buildPortraitLayout() {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: CountryDetectionCard()),
            SizedBox(height: Spacing.s16),
            Expanded(child: _PoliceCard()),
            SizedBox(height: Spacing.s16),
            Expanded(child: _AmbulanceCard()),
            SizedBox(height: Spacing.s16),
            Expanded(child: _FirefightersCard()),
            SizedBox(height: Spacing.s24),
            _Disclaimer(),
          ],
        ),
      ),
    );
  }

  /// Builds the UI for landscape mode.
  ///
  /// This layout creates two rows of main buttons, followed by a final row
  /// containing the descriptive text and the smaller action buttons.
  Widget _buildLandscapeLayout(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: CountryDetectionCard()),
                        SizedBox(width: Spacing.s16),
                        Expanded(child: _PoliceCard()),
                      ],
                    ),
                  ),
                  SizedBox(height: Spacing.s16),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: _AmbulanceCard()),
                        SizedBox(width: Spacing.s16),
                        Expanded(child: _FirefightersCard()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Spacing.s24),
            _Disclaimer(),
          ],
        ),
      ),
    );
  }
}

class _PoliceCard extends ConsumerWidget {
  const _PoliceCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(Marcos): Replace placeholder value.
    const phoneNumber = '110';

    return EmergencyContactCard(
      backgroundColor: AppColors.buttonBlue,
      icon: Icons.local_police,
      institutionName: context.l10n.police,
      phoneNumber: phoneNumber,
    );
  }
}

class _AmbulanceCard extends ConsumerWidget {
  const _AmbulanceCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(Marcos): Replace placeholder value.
    const phoneNumber = '112';

    return EmergencyContactCard(
      backgroundColor: AppColors.buttonGreen,
      icon: Icons.local_hospital,
      institutionName: context.l10n.ambulance,
      phoneNumber: phoneNumber,
    );
  }
}

class _FirefightersCard extends ConsumerWidget {
  const _FirefightersCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(Marcos): Replace placeholder value.
    const phoneNumber = '112';

    return EmergencyContactCard(
      backgroundColor: AppColors.buttonRed,
      icon: Icons.local_fire_department,
      institutionName: context.l10n.firefighters,
      phoneNumber: phoneNumber,
    );
  }
}

class _Disclaimer extends StatelessWidget {
  const _Disclaimer();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.disclaimer,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12, color: context.colorScheme.onSurface),
    );
  }
}
