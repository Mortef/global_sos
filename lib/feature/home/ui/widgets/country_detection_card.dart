import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:global_sos/core/ui/theme/app_colors.dart';
import 'package:global_sos/core/ui/widgets/surface_card.dart';
import 'package:global_sos/core/util/context_util.dart';
import 'package:global_sos/core/util/locale_util.dart';
import 'package:global_sos/core/util/spacing_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Define the flex values for each part of the widget to control their relative sizes.
// These values can be adjusted to change the layout proportions.
const int _kickerFlex = 24;
const int _titleFlex = 56;
const int _subtitleFlex = 20;

/// A widget that displays the detected country with its flag.
///
/// This widget is designed to be greedy and fill the available space.
/// Its content will scale to fit the available area, making it suitable for responsive designs.
class CountryDetectionCard extends StatelessWidget {
  const CountryDetectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      // TODO(Marcos): Implement country selection logic.
      onTap: () {},
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: Spacing.s8,
        children: [
          Expanded(flex: _kickerFlex, child: _CountryDetectionCardKicker()),
          Expanded(flex: _titleFlex, child: _CountryDetectionCardTitle()),
          Expanded(flex: _subtitleFlex, child: _CountryDetectionCardSubtitle()),
        ],
      ),
    );
  }
}

class _CountryDetectionCardKicker extends StatelessWidget {
  const _CountryDetectionCardKicker();

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: AppColors.countryWidgetKickerColor);

    return FittedBox(
      child: Text(context.l10n.countryWidgetKicker, style: textStyle),
    );
  }
}

// Private constants for styling.
const double _fontSize = 24.0;
const double _flagHeight = 20.0;
const double _flagWidth = 30.0; // _flagHeight * 1.5
const double _flagRadius = 4.0;

// We only need the country name and flag to be rebuilt when the country changes,
// so we can use a ConsumerWidget here to avoid unnecessary rebuilds.
class _CountryDetectionCardTitle extends ConsumerWidget {
  const _CountryDetectionCardTitle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(Marcos): Replace placeholder values with actual country detection logic.
    const detectedCountry = 'Germany'; // Placeholder for detected country
    const countryCode = 'DE'; // Placeholder for country code

    const flagTheme = ImageTheme(
      height: _flagHeight,
      width: _flagWidth,
      shape: RoundedRectangle(_flagRadius),
    );

    final countryFlag = CountryFlag.fromCountryCode(
      countryCode,
      theme: flagTheme,
    );

    final textStyle = TextStyle(
      color: context.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
      fontSize: _fontSize,
    );

    final countryText = Text(detectedCountry, style: textStyle);

    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [countryFlag, Spacing.s8.horizontal, countryText],
      ),
    );
  }
}

class _CountryDetectionCardSubtitle extends StatelessWidget {
  const _CountryDetectionCardSubtitle();

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: AppColors.textLink);

    return FittedBox(
      child: Text(context.l10n.countryWidgetSubtitle, style: textStyle),
    );
  }
}
