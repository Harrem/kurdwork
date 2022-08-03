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
  bool isVisible = false;
  @override
  void dispose() {
    super.dispose();
  }

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
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == "" || value == null || value.isEmpty) {
                              return "تکایە بۆشاییەکان پڕبکەوە";
                            } else if (!EmailValidator.validate(value)) {
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
                            ),
                          ),
                          validator: (value) {
                            if (value == "") {
                              return "تکایە بۆشاییەکان پڕبکەوە";
                            }
                            if (value!.length < 8) {
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
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: const Text(
                      'وشەی تێپەڕت بیرچۆتەوە؟',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: MyWidgets.myElevatedButton(
                    context,
                    onPressed: () async {
                      User? user;

                      if (formKey.currentState!.validate()) {
                        user = await Authentication.signInWithEmailAndPassword(
                            context: context, email: email, password: password);
                      }
                      setState(() {
                        if (user != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const HomeScreen(),
                            ),
                          );
                        }
                      });
                    },
                    text: "چوونەژورەوە",
                  ),
                ),
                const SizedBox(height: 20),
                MyWidgets.h3("یان", color: Colors.grey),
                const SizedBox(height: 20),
                MyWidgets.h3("چوونەژەرەوە لەگەڵ", color: Colors.grey),
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
                    const SizedBox(width: 15),
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
                MyWidgets.h3("تا ئێستا هەژمارت نییە؟", color: Colors.grey),
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: const Text(
                    'هەژمارێکی نوێ دروستبکە',
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
