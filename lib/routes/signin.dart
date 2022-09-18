import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurdwork/bloc/authentication_bloc/auth_bloc.dart';
import 'package:kurdwork/bloc/authentication_bloc/auth_event.dart';
import 'signup.dart';

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
    var authBloc = BlocProvider.of<AuthBloc>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign In",
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
                              labelText: "Email",
                            ),
                            validator: (value) {
                              if (value == "" ||
                                  value == null ||
                                  value.isEmpty) {
                                return "Field must not be empty";
                              } else if (!EmailValidator.validate(value)) {
                                return "Invalid Email!";
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
                              ),
                            ),
                            validator: (value) {
                              if (value == "") {
                                return "Field must not be empty";
                              }
                              if (value!.length < 8) {
                                return "Password should be more than 8 characters";
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
                        'Forgot Password?',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          authBloc.add(SignInRequested(
                              emailController.value.text,
                              passwordController.value.text));
                        }
                      },
                      child: const Text("Sign In"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("or"),
                  const SizedBox(height: 10),
                  const Text("Sign in with"),
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
                            },
                            style: ElevatedButton.styleFrom(
                                primary:
                                    const Color.fromARGB(255, 255, 255, 255),
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
                  const Text("Don't have an account yet?"),
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
                      'Create Account',
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
