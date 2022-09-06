import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurdwork/services/authentication.dart';

import 'auth_event.dart';
import 'auth_state.dart';

//TODO: Implement Error handling

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Authentication auth;

  AuthBloc({required this.auth}) : super(Unauthenticated()) {
    on<AppStarted>(((event, emit) async {
      bool userLoggedIn = await auth.checkAuth();
      if (userLoggedIn) {
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    }));

    on<SignInRequested>(
      ((event, emit) async {
        emit(Loading());

        try {
          User? user = await auth.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          if (user != null) {
            emit(Authenticated());
          } else {
            emit(Unauthenticated());
            log("error while Signing in !!!");
          }
        } catch (e) {
          emit(AuthError(e.toString()));
        }
      }),
    );

    on<SignUpRequested>(
      (event, emit) async {
        emit(Loading());

        try {
          await auth.signUpWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(Authenticated());
        } catch (e) {
          emit(AuthError(e.toString()));
        }
      },
    );

    on<GoogleSignInRequested>(
      (event, emit) async {
        emit(Loading());

        try {
          User? user = await auth.signInWithGoogle();
          if (user != null) {
            emit(Authenticated());
          } else {
            emit(Unauthenticated());
            log("error while Signing in !!!");
          }
        } catch (e) {
          emit(AuthError(e.toString()));
          emit(Unauthenticated());
        }
      },
    );

    on<SignOutRequested>(
      (event, emit) async {
        emit(Loading());

        try {
          await auth.signOut();
          emit(Unauthenticated());
        } catch (e) {
          emit(AuthError(e.toString()));
        }
      },
    );
  }
}
