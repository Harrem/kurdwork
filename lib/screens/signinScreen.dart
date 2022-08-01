import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kurdwork/myWidgets.dart';
import '../authentication.dart';
import 'signupScreen.dart';
import 'homeScreen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String email = "", password = "";
  final formKey = GlobalKey<FormState>();
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
                MyWidgets.h1("چوونە ناو هەژماری تایبەت"),
                const SizedBox(height: 30),
                MyWidgets.h3("چوونەژەرەوە لەگەڵ", color: Colors.grey),
                const SizedBox(height: 10),
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
                        if (user != null) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
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
                MyWidgets.h3("چوونەژەرەوە بە ئیمەیل یان ژمارە مۆبایل",
                    color: Colors.grey),
                const SizedBox(height: 10),
                Form(
                  key: formKey,
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
                            errorBorder: InputBorder.none,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == "") {
                              return "تکایە بۆشاییەکان پڕبکەوە";
                            }
                            if (!EmailValidator.validate(email)) {
                              return "هەڵە هەیە لە ئیمەیلەکە";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: TextFormField(
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
                          ),
                          validator: (value) {
                            if (value == "") {
                              return "تکایە بۆشاییەکان پڕبکەوە";
                            }
                            if (value!.length < 7) {
                              return "وشەی تێپەر پێویستە لە ٨ پیت یان ژمارە زیاتربێت";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (value.length > 7) {
                              password = value;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    User? user;
                    user = await Authentication.signInWithEmailAndPassword(
                        context: context, email: email, password: password);

                    setState(() {
                      if (formKey.currentState!.validate()) {
                        if (user != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const HomeScreen(),
                            ),
                          );
                        }
                      }
                    });
                  },
                  child: const Text("چوونەژوورەوە"),
                ),
                const SizedBox(height: 20),
                MyWidgets.h3("هەژماری تایبەت بە خۆتت نییە؟",
                    color: Colors.grey),
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: const Text(
                    'دروستکردنی هەژماری نوێ',
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
