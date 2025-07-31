import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:global_sos/core/ui/theme/app_colors.dart';
import 'package:global_sos/core/util/util_libs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Define the flex values for each part of the widget to control their relative sizes.
// These values can be adjusted to change the layout proportions.
const int _kKickerFlex = 25;
const int _kTitleFlex = 53;
const int _kSubtitleFlex = 22;

/// A widget that displays the detected country with its flag.
///
/// This widget is designed to be greedy and fill the available space.
/// Its content will scale to fit the available area, making it suitable for responsive designs.
class CountryWidget extends StatelessWidget {
  const CountryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadii.large),
      padding: EdgeInsets.symmetric(
        vertical: Spacing.s16,
        horizontal: Spacing.s20,
      ),
    );

    return ElevatedButton(
      //TODO(Marcos): Implement country selection logic
      onPressed: () {},
      style: buttonStyle,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: _kKickerFlex, child: const _CountryWidgetKicker()),
          Spacing.s4.vertical,
          Expanded(flex: _kTitleFlex, child: const _CountryWidgetTitle()),
          Spacing.s8.vertical,
          Expanded(flex: _kSubtitleFlex, child: const _CountryWidgetSubtitle()),
        ],
      ),
    );
  }
}

class _CountryWidgetKicker extends StatelessWidget {
  const _CountryWidgetKicker();

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: AppColors.countryWidgetKickerColor);

    return FittedBox(
      fit: BoxFit.contain,
      child: Text(context.l10n.countryWidgetKicker, style: textStyle),
    );
  }
}

// Private constants for styling.
const double _kFontSize = 24.0;
const double _kFlagHeight = 20.0;
const double _kFlagWidth = 30.0; // _kFlagHeight * 1.5
const double _kFlagRadius = 4.0;

// We only need the country name and flag to be rebuilt when the country changes,
// so we can use a ConsumerWidget here to avoid unnecessary rebuilds.
class _CountryWidgetTitle extends ConsumerWidget {
  const _CountryWidgetTitle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(Marcos): Replace placeholder values with actual country detection logic.
    final detectedCountry = 'Germany'; // Placeholder for detected country
    final countryCode = 'DE'; // Placeholder for country code

    final countryFlag = CountryFlag.fromCountryCode(
      countryCode,
      height: _kFlagHeight,
      width: _kFlagWidth,
      shape: RoundedRectangle(_kFlagRadius),
    );

    final textStyle = TextStyle(
      color: context.theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
      fontSize: _kFontSize,
    );

    final countryText = Text(detectedCountry, style: textStyle);

    return FittedBox(
      fit: BoxFit.contain,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [countryFlag, Spacing.s8.horizontal, countryText],
      ),
    );
  }
}

class _CountryWidgetSubtitle extends StatelessWidget {
  const _CountryWidgetSubtitle();

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: AppColors.textLink);

    return FittedBox(
      fit: BoxFit.contain,
      child: Text(context.l10n.countryWidgetSubtitle, style: textStyle),
    );
  }
}
