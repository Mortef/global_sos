// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'SOS Global';

  @override
  String get welcomeMessage => 'Bienvenido a SOS Global';

  @override
  String get errorMessage => 'Ha ocurrido un error';

  @override
  String get retryButton => 'Intentar de nuevo';

  @override
  String get countryWidgetKicker => 'País Detectado';

  @override
  String get countryWidgetSubtitle => '¿Incorrecto? Pulsa para cambiar';

  @override
  String get dialerError =>
      'No se puede iniciar el marcador. Por favor, verifica la configuración de tu teléfono.';

  @override
  String get phoneNumberNotAvailable => 'Número de teléfono no disponible.';
}
