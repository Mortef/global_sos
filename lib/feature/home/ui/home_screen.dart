import 'package:flutter/material.dart';
import 'package:global_sos/core/util/locale_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(context.l10n.welcomeMessage)));
  }
}
