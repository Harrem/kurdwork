import 'package:flutter/material.dart';
import 'signinScreen.dart';
import 'signupScreen.dart';
import 'package:kurdwork/myWidgets.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/Teamwork.png",
                  width: 250,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'بەخێربێیت',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 350,
                  child: Text(
                    ' بەخێربێیت بۆ پلاتفۆرمی کوردوۆرک لێرە باشترین کەسانی شارەزا بۆ کارەکەت بدۆزەوە، یان هەلی کار بۆ خۆت بدۆزەوە',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 70),
                MyWidgets.myElevatedButton(
                  context,
                  text: "چوونە بەژوورەوە",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SigninScreen()),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'دروستکردنی هەژماری نوێ',
                      style: TextStyle(fontSize: 20),
                    ),
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
