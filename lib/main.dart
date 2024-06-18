import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub/core/helper/on_generate_routes.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
