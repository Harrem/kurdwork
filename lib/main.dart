import 'package:flutter/material.dart';
import 'package:kurdwork/screens/welcomeScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/welcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'SA'),
        ],
        locale: const Locale('ar', 'AE'),
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.deepPurple,
          fontFamily: "NRT",
        ),
        home: WelcomeScreen());
  }
}
