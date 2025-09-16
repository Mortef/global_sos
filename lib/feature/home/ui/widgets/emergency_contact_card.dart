import 'package:flutter/material.dart';
import 'package:global_sos/core/ui/widgets/surface_card.dart';
import 'package:global_sos/core/util/spacing_util.dart';
import 'package:url_launcher/url_launcher.dart';

// Define the flex values for each part of the widget to control their relative sizes.
// These values can be adjusted to change the layout proportions.
const int _leadingFlex = 20;
const int _middleFlex = 58;
const int _trailingFlex = 20;

/// A widget that displays the institution's name and phone number.
///
/// This widget is designed to be greedy and fill the available space.
/// Its content will scale to fit the available area, making it suitable for responsive designs.
class EmergencyContactCard extends StatelessWidget {
  const EmergencyContactCard({
    required this.backgroundColor,
    required this.icon,
    required this.institutionName,
    required this.phoneNumber,
    super.key,
  });

  final Color backgroundColor;
  final IconData icon;
  final String institutionName;
  final String? phoneNumber;

  void _launchDialer() {
    final phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    launchUrl(phoneUri);
  }

  @override
  Widget build(BuildContext context) {
    final leadingIcon = FittedBox(child: Icon(icon));

    final middleContent = _MiddleContent(
      institutionName: institutionName,
      phoneNumber: phoneNumber,
    );

    const trailingIcon = FittedBox(child: Icon(Icons.call));

    return SurfaceCard(
      onTap: phoneNumber != null ? _launchDialer : null,
      backgroundColor: backgroundColor,
      child: Row(
        children: [
          Expanded(flex: _leadingFlex, child: leadingIcon),
          Spacing.s32.horizontal,
          Expanded(flex: _middleFlex, child: middleContent),
          Spacing.s80.horizontal,
          const Expanded(flex: _trailingFlex, child: trailingIcon),
        ],
      ),
    );
  }
}

const int _institutionFlex = 40;
const int _phoneNumberFlex = 60;

class _MiddleContent extends StatelessWidget {
  const _MiddleContent({required this.institutionName, this.phoneNumber});

  final String institutionName;
  final String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacing.s16.vertical,
        Expanded(
          flex: _institutionFlex,
          child: FittedBox(
            child: Text(
              institutionName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Spacing.s4.vertical,
        Expanded(
          flex: _phoneNumberFlex,
          child: FittedBox(child: Text(phoneNumber ?? '')),
        ),
        Spacing.s10.vertical,
      ],
    );
  }
}
