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
}
