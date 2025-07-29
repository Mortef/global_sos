import 'package:flutter/material.dart';
import 'package:global_sos/core/util/locale_util.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(context.l10n.welcomeMessage)));
  }
}
