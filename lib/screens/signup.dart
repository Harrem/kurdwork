// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurdwork/bloc/authentication_bloc/auth_bloc.dart';
import 'package:kurdwork/bloc/authentication_bloc/auth_event.dart';
import 'package:kurdwork/myWidgets.dart';
import 'package:kurdwork/screens/create_profile.dart';
import 'signin.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyWidgets.h1("Create New Account"),
                const SizedBox(height: 30),
                MyWidgets.h3("Sign up with", color: Colors.grey),
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
                            authBloc.add(GoogleSignInRequested());

                            //TODO: Check if user signed in or up the first time then navigate to CreateProfile

                            // bool exists = await FirebaseFirestore.instance
                            //     .collection("users")
                            //     .doc(user!.uid)
                            //     .get()
                            //     .then((value) => value.exists);
                            // if (exists) {
                            //   // ignore: use_build_context_synchronously
                            //   Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (BuildContext context) =>
                            //           const CreateProfile(),
                            //     ),
                            //   );
                            // }
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
                MyWidgets.h3("Create using Email", color: Colors.grey),
                const SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Email",
                          ),
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "Field must not be empty";
                            }
                            if (!EmailValidator.validate(value)) {
                              return "Invalid Email";
                            }
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
                              labelText: "Password",
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
                              return "Field must not be empty";
                            }
                            if (value!.length < 8) {
                              return "Must be more that 8 characters";
                            }
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
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        FirebaseAuth.instance.currentUser;
                        authBloc.add(
                          SignUpRequested(
                              emailController.text, passwordController.text),
                        );
                      }

                      //TODO: get to create profile
                      // if (user != null) {
                      //   debugPrint("User created \n user email: $user");
                      //   Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (BuildContext context) =>
                      //           const CreateProfile(),
                      //     ),
                      //   );
                      // }
                      // });
                    },
                    child: const Text("Sign Up"),
                  ),
                ),
                const SizedBox(height: 20),
                MyWidgets.h3("Have an account?", color: Colors.grey),
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SigninScreen()),
                    );
                  },
                  child: const Text(
                    'Sign In',
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
