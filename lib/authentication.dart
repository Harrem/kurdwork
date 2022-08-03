import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    return firebaseApp;
  }

  static Future<User?> signUpWithEmailAndPassword(
      {required context, required email, required password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(content: "$e"),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    return user;
  }

  static Future<User?> signInWithEmailAndPassword(
      {required context, required email, required password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(content: "ئەم هەژمارە بوونی نییە!"),
        );
      }
      if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(content: "وشەی تەپەڕت هەڵەیە!"),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(content: "an error occured: $e"),
      );
    }

    return user;
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount;
    try {
      googleSignInAccount = await googleSignIn.signIn();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error occurred while accessing credentials. Try again :$e',
        ),
      );
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
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'Error occurred using Google Sign-In. Try again.',
          ),
        );
      }
    }
    return user;
  }

  static Future<void> signOut({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error while signing out. Try again. \n $e',
        ),
      );
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
