// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurdwork/bloc/authentication_bloc/auth_bloc.dart';
import 'package:kurdwork/bloc/authentication_bloc/auth_event.dart';
import 'package:kurdwork/screens/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kurdwork/screens/profile_screens/profile.dart';
import 'package:kurdwork/screens/signin.dart';
import 'package:kurdwork/theme/custom_theme.dart';
import 'bloc/authentication_bloc/auth_state.dart';
import 'firebase_options.dart';
import 'services/authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => Authentication(),
      child: BlocProvider(
        create: (context) =>
            AuthBloc(auth: RepositoryProvider.of<Authentication>(context)),
        child: MaterialApp(
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
              child: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is Authenticated) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  } else if (state is Unauthenticated) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SigninScreen()));
                  } else if (state is Loading) {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()));
                  }
                },
                child: FutureBuilder(builder: ((context, snapshot) {
                  if (FirebaseAuth.instance.currentUser != null) {
                    return const HomeScreen();
                  }
                  return const SigninScreen();
                })),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
