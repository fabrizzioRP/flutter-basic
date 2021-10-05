import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Created for me
import 'package:provider/provider.dart';
import 'package:componentes_app/src/routes/routers.dart';
import 'package:componentes_app/src/providers/theme_states.dart';
import 'package:componentes_app/src/pages/alert_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  //Provider.debugCheckInvalidValueType = null;
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeState()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeState>(
      builder: (context, state, child) {
        return MaterialApp(
          title: 'Componentes APP',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', 'US'), // English, no country code
            Locale('es', 'ES'), // Spanish, no country code
          ],
          initialRoute: '/',
          routes: getRoutes(),
          onGenerateRoute: (RouteSettings settings) {
            //  print('Ruta Llamada : ${settings.name}');
            return MaterialPageRoute(
                builder: (BuildContext context) => AlertPage());
          },
          theme: state.currentTheme,
        );
      },
    );
  }
}
