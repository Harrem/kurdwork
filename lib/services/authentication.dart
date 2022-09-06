import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

//TODO: Handle Errors Properly

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    return firebaseApp;
  }

  Future<bool> checkAuth() async {
    if (auth.currentUser != null) {
      return true;
    }
    return false;
  }

  Future<User?> signUpWithEmailAndPassword(
      {required email, required password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return Future.error("User Not Found");
      } else if (e.code == "wrong-password") {
        return Future.error("Invalid Password");
      } else if (e.code == "invalid-email") {
        return Future.error("Invalid Email Address");
      } else {
        return Future.error(e.message.toString());
      }
    } on SocketException catch (e) {
      debugPrint(e.message);
      return Future.error("Network Error");
    } catch (e) {
      return Future.error(e.toString());
    }
    return user;
  }

  Future<User?> signInWithEmailAndPassword(
      {required email, required password}) async {
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return Future.error("User Not Found");
      } else if (e.code == "wrong-password") {
        return Future.error("Invalid Password");
      } else if (e.code == "invalid-email") {
        return Future.error("Invalid Email Address");
      } else {
        return Future.error(e.message.toString());
      }
    } on SocketException catch (e) {
      return Future.error("Network Error: $e");
    } catch (e) {
      return Future.error(e.toString());
    }

    return user;
  }

  Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount;
    try {
      googleSignInAccount = await googleSignIn.signIn();
    } catch (e) {
      Future.error("$e");
    }

    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.message == 'account_exists_with_different_creditential') {
          //handleErrorHere
          Authentication.customSnackBar(
            content: 'The account already exists with a different credential.',
          );
        } else if (e.code == "invalid-credential") {
          Future.error("${e.message}");
        }
      } catch (e) {
        Future.error("$e");
      }
    }
    return user;
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Future.error(e.toString());
    }
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        content,
        style: const TextStyle(
            fontFamily: "NRT", color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }
}
