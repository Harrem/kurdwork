import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurdwork/bloc/authentication_bloc/auth_bloc.dart';
import 'package:kurdwork/bloc/authentication_bloc/auth_event.dart';
import 'package:kurdwork/route.dart';
import 'package:kurdwork/routes/create_profile.dart';
import 'package:kurdwork/routes/home.dart';
import 'package:kurdwork/routes/signin.dart';
import 'package:kurdwork/theme/custom_theme.dart';
import 'bloc/authentication_bloc/auth_state.dart';
import 'bloc/user_bloc/user_bloc.dart';
import 'bloc/user_bloc/user_event.dart';
import 'bloc/user_bloc/user_state.dart';
import 'firebase_options.dart';
import 'services/authentication.dart';

//TODO: add splash screen

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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(auth: RepositoryProvider.of<Authentication>(context)),
          ),
          BlocProvider(
            create: (context) => UserBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.lightTheme,
          onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
          home: Scaffold(
            body: Center(
              child: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is Authenticated) {
                    context.read<UserBloc>().add(InitializeUser());
                  } else if (state is Unauthenticated) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SigninScreen()));
                  } else if (state is Loading) {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is AuthError) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                child: BlocListener<UserBloc, UserState>(
                    listener: (context, state) {
                  if (state is UserNotInitialized) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateProfile(),
                      ),
                    );
                  } else if (state is UserInitialized) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }
                }, child: FutureBuilder(
                  builder: ((context, snapshot) {
                    context.read<AuthBloc>().add(AppStarted());
                    return const CircularProgressIndicator();
                  }),
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
