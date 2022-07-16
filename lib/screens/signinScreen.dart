import 'package:flutter/material.dart';
import 'package:kurdwork/myWidgets.dart';
import 'signupScreen.dart';
import 'homeScreen.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("چوونەژوورەوە")),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyWidgets.h1("چوونە ناو هەژماری تایبەت"),
                  const SizedBox(height: 30),
                  MyWidgets.h3("چوونەژەرەوە لەگەڵ", color: Colors.grey),
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
                  MyWidgets.h3("چوونەژەرەوە بە ئیمەیل یان ژمارە مۆبایل",
                      color: Colors.grey),
                  const SizedBox(height: 10),
                  MyWidgets.myTextField(
                    context,
                    labelText: "ئیمەیل یان ژمارە مۆبایل",
                    width: 330,
                  ),
                  const SizedBox(height: 10),
                  MyWidgets.myTextField(context,
                      labelText: "وشەی تێپەر", width: 330),
                  const SizedBox(height: 30),
                  MyWidgets.myElevatedButton(
                    context,
                    text: "چوونەژوورەوە",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
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
      ),
    );
  }
}
