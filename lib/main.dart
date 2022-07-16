import 'package:flutter/material.dart';
import 'package:kurdwork/screens/welcomeScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/welcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'SA'),
        ],
        locale: const Locale('ar', 'AE'),
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: "NRT",
        ),
        home: WelcomeScreen());
  }
}
