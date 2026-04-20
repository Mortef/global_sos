import 'package:flutter/material.dart';
import 'package:global_sos/core/ui/theme/custom_theme.dart';
import 'package:global_sos/feature/home/ui/home_view.dart';
import 'package:global_sos/l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global SOS',
      theme: CustomTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomeView(),
    );
  }
}
