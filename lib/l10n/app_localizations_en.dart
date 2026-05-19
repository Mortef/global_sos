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

  @override
  String get warningScreenTitle => 'How Location Works';

  @override
  String get warningScreenDescription =>
      'This app works entirely offline using your phone\'s GPS and cell signals. When arriving in a new country, open the app with GPS enabled to update your location automatically, or simply select your country manually';

  @override
  String get warningScreenButtonText => 'Understood';
}
