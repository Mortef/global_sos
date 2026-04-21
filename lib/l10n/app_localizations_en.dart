// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get currentLocation => 'CURRENT LOCATION';

  @override
  String get police => 'Police';

  @override
  String get ambulance => 'Ambulance';

  @override
  String get fire => 'Fire';

  @override
  String get disclaimer =>
      'Numbers are based on the detected country. Use with caution and verify if possible.';
}
