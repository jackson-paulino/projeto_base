import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/shared/dependency_injection/shell.dart';
import 'src/shared/route_pages/route_generator.dart';
import 'src/shared/theme/theme.dart';

void main() {
  runApp(Shell(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'projeto base',
      theme: AppTheme(context).defaultTheme,
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale('en', 'US'), Locale('pt', 'BR')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      onGenerateRoute: RouteGenerator.generatorRoute,
    );
  }
}
