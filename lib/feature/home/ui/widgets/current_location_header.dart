part of '../home_view.dart';

// Define the flex values for each part of the widget to control their relative sizes.
// These values can be adjusted to change the layout proportions.
const int _headerFlex = 40;
const int _countryFlex = 60;

/// Header widget that displays the current location and country name.
///
/// This widget is designed to be greedy and fill the available space.
/// Its content will scale to fit the available area, making it suitable for responsive designs.
class _CurrentLocationHeader extends StatelessWidget {
  const _CurrentLocationHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: _headerFlex, child: _HeaderRow()),
              Expanded(flex: _countryFlex, child: _CountryName()),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_CurrentLocationText(), _HeaderButtons()],
    );
  }
}

class _CurrentLocationText extends StatelessWidget {
  const _CurrentLocationText();

  @override
  Widget build(BuildContext context) {
    // Flexible + FittedBox ensures long translations shrink instead of overflowing
    return Flexible(
      child: FittedBox(
        alignment: Alignment.centerLeft,
        child: Text(
          context.l10n.currentLocation,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: context.colors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

class _HeaderButtons extends StatelessWidget {
  const _HeaderButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TODO(Marcos): Implement refresh functionality.
        CircularIconButton(icon: Icons.refresh, onPressed: () {}),
        Spacing.small.horizontal,
        // TODO(Marcos): Implement swap functionality.
        CircularIconButton(icon: Icons.swap_horiz, onPressed: () {}),
      ],
    );
  }
}

class _CountryName extends StatelessWidget {
  const _CountryName();

  @override
  Widget build(BuildContext context) {
    // TODO(Marcos): Replace placeholder value.
    const countryName = 'Spain';

    return FittedBox(
      alignment: Alignment.centerLeft,
      child: Text(
        countryName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: context.colors.onSurface,
        ),
      ),
    );
  }
}
