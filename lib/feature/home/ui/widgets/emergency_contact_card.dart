part of '../home_view.dart';

// Define the flex values for each part of the widget to control their relative sizes.
// These values can be adjusted to change the layout proportions.
// The sum of the flex values is 100, representing 100% of the available space.
const int _leadingFlex = 22;
const int _middleFlex = 66;
const int _trailingFlex = 12;

/// A widget that displays the institution's name and phone number.
///
/// This widget is designed to be greedy and fill the available space.
/// Its content will scale to fit the available area, making it suitable for responsive designs.
class _EmergencyContactCard extends StatelessWidget {
  const _EmergencyContactCard({
    required this.icon,
    required this.iconColor,
    required this.institutionName,
    required this.phoneNumber,
  });

  final IconData icon;
  final Color iconColor;
  final String institutionName;
  final String? phoneNumber;

  void _launchDialer() {
    final phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    launchUrl(phoneUri);
  }

  @override
  Widget build(BuildContext context) {
    final leadingIcon = _LeadingIcon(icon: icon, iconColor: iconColor);

    final contactInfo = _ContactInfo(
      institutionName: institutionName,
      phoneNumber: phoneNumber,
      numberColor: iconColor,
    );

    final trailingIcon = FittedBox(
      child: Icon(Icons.chevron_right, color: context.colors.onSurfaceVariant),
    );

    return SurfaceCard(
      onTap: phoneNumber != null ? _launchDialer : null,
      child: Row(
        children: [
          Expanded(flex: _leadingFlex, child: leadingIcon),
          Spacing.large.horizontal,
          Expanded(flex: _middleFlex, child: contactInfo),
          Spacing.medium.horizontal,
          Expanded(flex: _trailingFlex, child: trailingIcon),
        ],
      ),
    );
  }
}

// Define the size of the whole icon (container + icon).
// The size is set to 100 to symbolize a percentage,
// the actual size is irrelevant because it will be scaled to fit the available space.
const double _iconSize = 100.0;

class _LeadingIcon extends StatelessWidget {
  const _LeadingIcon({required this.icon, required this.iconColor});

  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: _iconSize,
        height: _iconSize,
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerLowest,
          shape: BoxShape.circle,
        ),
        child: Center(
          // The icon size is set to 60% of the container size.
          child: Icon(icon, color: iconColor, size: _iconSize * 0.6),
        ),
      ),
    );
  }
}

// Define the flex values for each part of the widget to control their relative sizes.
// These values can be adjusted to change the layout proportions.
// The sum of the flex values is 100, representing 100% of the available space.
const int _institutionFlex = 60;
const int _phoneNumberFlex = 40;

class _ContactInfo extends StatelessWidget {
  const _ContactInfo({
    required this.institutionName,
    this.phoneNumber,
    required this.numberColor,
  });

  final String institutionName;
  final String? phoneNumber;
  final Color numberColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.medium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: _institutionFlex,
            child: FittedBox(
              child: Text(
                institutionName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Spacing.tiny.vertical,
          Expanded(
            flex: _phoneNumberFlex,
            child: FittedBox(
              child: Text(
                phoneNumber ?? 'N/A',
                style: TextStyle(color: numberColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
