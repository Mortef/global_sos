import 'package:flutter/material.dart';
import 'package:global_sos/core/providers/global_providers.dart';
import 'package:global_sos/core/ui/home_view.dart';
import 'package:global_sos/core/ui/theme/custom_theme.dart';
import 'package:global_sos/core/util/locale_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorKey = ref.watch(navigatorKeyProvider);
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateTitle: (context) => context.l10n.appTitle,
      theme: CustomTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: AppLocale.resolveLocale,
      home: const HomeView(),
    );
  }
}
