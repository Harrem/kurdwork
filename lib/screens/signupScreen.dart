import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:kurdwork/myWidgets.dart';
import 'package:kurdwork/screens/homeScreen.dart';
import 'signinScreen.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  String email = "", password = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyWidgets.h1("دروستکردنی هەژماری تایبەت"),
                  const SizedBox(height: 30),
                  MyWidgets.h3("دروستکردن لەگەڵ", color: Colors.grey),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              FirebaseAuth.instance
                                  .signInWithAuthProvider(GoogleAuthProvider());
                            },
                            style: ElevatedButton.styleFrom(
                                primary:
                                    const Color.fromARGB(255, 255, 211, 211),
                                elevation: 0,
                                fixedSize: const Size(60, 60),
                                padding: const EdgeInsets.all(9)),
                            clipBehavior: Clip.none,
                            child: SizedBox(
                              height: 55,
                              width: 55,
                              child: Image.asset("assets/icons/google.png"),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 221, 247, 255),
                              elevation: 0,
                              fixedSize: const Size(60, 60),
                              padding: const EdgeInsets.all(7)),
                          clipBehavior: Clip.none,
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/icons/facebook.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  MyWidgets.h3("دروستکردن بە ئیمەیل یان ژمارە مۆبایل",
                      color: Colors.grey),
                  const SizedBox(height: 10),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "ئیمەیل",
                                labelStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == "") {
                                  return "please enter your email or phone number";
                                }
                              },
                              onChanged: (value) {
                                email = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "وشەی تێپەر",
                                labelStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onChanged: (value) {
                                password = value;
                              },
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(height: 30),
                  MyWidgets.myElevatedButton(
                    context,
                    text: "دروستکردن",
                    onPressed: () {
                      setState(() {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            )
                            .catchError((error) => print(error));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  MyWidgets.h3("هەژماری تایبەت بە خۆتت هەیە؟",
                      color: Colors.grey),
                  const SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SigninScreen()),
                      );
                    },
                    child: const Text(
                      'بچۆرە ژوورەوە',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
