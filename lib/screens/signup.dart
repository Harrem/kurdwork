// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:kurdwork/myWidgets.dart';
import 'package:kurdwork/screens/create_profile.dart';
import '../services/authentication.dart';
import 'signin.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email = "", password = "";
  bool isVisible = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
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
                          onPressed: () async {
                            User? user;
                            user = await Authentication.signInWithGoogle(
                                context: context);

                            bool exists = await FirebaseFirestore.instance
                                .collection("users")
                                .doc(user!.uid)
                                .get()
                                .then((value) => value.exists);
                            if (exists) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const CreateProfile(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 255, 255, 255),
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true,
                            labelText: "ئیمەیل",
                            labelStyle: const TextStyle(color: Colors.grey),
                            floatingLabelStyle:
                                const TextStyle(color: Colors.deepPurple),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "تکایە بۆشاییەکان پڕبکەوە";
                            }
                            if (!EmailValidator.validate(value)) {
                              return "هەڵە هەیە لە ئیمەیلەکە";
                            }
                            email = value;
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: TextFormField(
                          obscureText: !isVisible,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              labelText: "وشەی تێپەر",
                              labelStyle: const TextStyle(color: Colors.grey),
                              floatingLabelStyle:
                                  const TextStyle(color: Colors.deepPurple),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: isVisible
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              )),
                          validator: (value) {
                            if (value == "") {
                              return "تکایە بۆشاییەکان پڕبکەوە";
                            }
                            if (value!.length < 8) {
                              return "وشەی تێپەر پێویستە لە ٨ پیت یان ژمارە زیاتربێت";
                            }
                            password = value;
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: MyWidgets.myElevatedButton(
                    text: "دروستکردن",
                    onPressed: () async {
                      User? user;
                      if (_formKey.currentState!.validate()) {
                        user = await Authentication.signUpWithEmailAndPassword(
                            context: context, email: email, password: password);
                      }
                      setState(() {
                        if (user != null) {
                          debugPrint("User created \n user email: $user");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const CreateProfile(),
                            ),
                          );
                        }
                      });
                    },
                  ),
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
    );
  }
}
