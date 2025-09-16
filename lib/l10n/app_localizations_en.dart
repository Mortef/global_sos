// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Global SOS';

  @override
  String get welcomeMessage => 'Welcome to Global SOS';

  @override
  String get errorMessage => 'An error has occurred';

  @override
  String get retryButton => 'Try Again';

  @override
  String get countryWidgetKicker => 'Detected Country';

  @override
  String get countryWidgetSubtitle => 'Not right? Tap to change';

  @override
  String get dialerError =>
      'Cannot launch dialer. Please check your phone settings.';

  @override
  String get phoneNumberNotAvailable => 'Phone number not available.';
}
