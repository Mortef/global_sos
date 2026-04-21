import 'package:flutter/material.dart';
import 'package:global_sos/core/ui/theme/app_palette.dart';
import 'package:global_sos/core/ui/widgets/circular_icon_button.dart';
import 'package:global_sos/core/ui/widgets/surface_card.dart';
import 'package:global_sos/core/utils/context_utils.dart';
import 'package:global_sos/core/utils/spacing_util.dart';
import 'package:url_launcher/url_launcher.dart';

part 'widgets/current_location_header.dart';
part 'widgets/emergency_contact_card.dart';

/// Main view of the application.
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.medium,
            vertical: Spacing.large,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 2, child: _CurrentLocationHeader()),
              Spacing.medium.vertical,
              Expanded(flex: 3, child: _PoliceCard()),
              Spacing.medium.vertical,
              Expanded(flex: 3, child: _AmbulanceCard()),
              Spacing.medium.vertical,
              Expanded(flex: 3, child: _FirefightersCard()),
              Spacing.medium.vertical,
              _Disclaimer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PoliceCard extends StatelessWidget {
  const _PoliceCard();

  @override
  Widget build(BuildContext context) {
    // TODO(Marcos): Replace placeholder value.
    const phoneNumber = '110';

    return _EmergencyContactCard(
      icon: Icons.local_police,
      iconColor: AppPalette.policeIcon,
      institutionName: context.l10n.police,
      phoneNumber: phoneNumber,
    );
  }
}

class _AmbulanceCard extends StatelessWidget {
  const _AmbulanceCard();

  @override
  Widget build(BuildContext context) {
    // TODO(Marcos): Replace placeholder value.
    const phoneNumber = '112';

    return _EmergencyContactCard(
      icon: Icons.local_hospital,
      iconColor: AppPalette.ambulanceIcon,
      institutionName: context.l10n.ambulance,
      phoneNumber: phoneNumber,
    );
  }
}

class _FirefightersCard extends StatelessWidget {
  const _FirefightersCard();

  @override
  Widget build(BuildContext context) {
    // TODO(Marcos): Replace placeholder value.
    const phoneNumber = '112';

    return _EmergencyContactCard(
      icon: Icons.local_fire_department,
      iconColor: AppPalette.fireIcon,
      institutionName: context.l10n.fire,
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
      style: TextStyle(fontSize: 12, color: context.colors.onSurface),
    );
  }
}
