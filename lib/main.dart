// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kurdwork/screens/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kurdwork/screens/signin.dart';
import 'package:kurdwork/theme/custom_theme.dart';
import 'services/authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Authentication.initializeFirebase();
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
        Locale('en', ''),
      ],
      locale: const Locale('en', ''),
      theme: CustomTheme.lightTheme,
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: Authentication.initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Error initializing Firebase');
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (FirebaseAuth.instance.currentUser != null) {
                  return const HomeScreen();
                }
                return const SigninScreen();
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
