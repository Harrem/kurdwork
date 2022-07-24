import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kurdwork/myWidgets.dart';
import 'signinScreen.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                  MyWidgets.outlineButton(
                    text: "گۆگڵ",
                    icon: Image.asset(
                      "assets/icons/google.png",
                      width: 30,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 10),
                  MyWidgets.outlineButton(
                    text: "فەیسبووک",
                    icon: Image.asset(
                      "assets/icons/facebook.png",
                      width: 30,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 40),
                  MyWidgets.h3("دروستکردن بە ئیمەیل یان ژمارە مۆبایل",
                      color: Colors.grey),
                  const SizedBox(height: 10),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "ئیمەیل",
                              labelStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "ژمارەی مۆبایل",
                              labelStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                        ],
                      )),
                  const SizedBox(height: 10),
                  MyWidgets.myTextField(context,
                      labelText: "وشەی تێپەر", width: 330),
                  const SizedBox(height: 30),
                  MyWidgets.myElevatedButton(
                    context,
                    text: "دروستکردن",
                    onPressed: () {
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
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
