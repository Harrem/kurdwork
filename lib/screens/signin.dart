import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../myWidgets.dart';
import '../services/authentication.dart';
import 'signup.dart';
import 'home.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final formKey = GlobalKey<FormState>();
  bool isVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                Text(
                  "چوونە ناو هەژمارەکەت",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //Email TextFormField
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: "ئیمەیل",
                          ),
                          validator: (value) {
                            if (value == "" || value == null || value.isEmpty) {
                              return "تکایە بۆشاییەکان پڕبکەوە";
                            } else if (!EmailValidator.validate(value)) {
                              return "هەڵە هەیە لە ئیمەیلەکە";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      //Password TextFromField
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: !isVisible,
                          decoration: InputDecoration(
                            labelText: "وشەی تێپەر",
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
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()),
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
                  child: ElevatedButton(
                    onPressed: () async {
                      User? user;

                      if (formKey.currentState!.validate()) {
                        user = await Authentication.signInWithEmailAndPassword(
                          context: context,
                          email: emailController.value.text,
                          password: passwordController.value.text,
                        );
                      }
                      setState(
                        () {
                          if (user != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const HomeScreen(),
                              ),
                            );
                          }
                        },
                      );
                    },
                    child: const Text("چوونەژورەوە"),
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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const HomeScreen(),
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
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()),
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
