import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kurdwork/myWidgets.dart';
import '../screens/signin.dart';

import '../services/authentication.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15),
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("ڕێکخستنەکان",
                    style: TextStyle(
                        fontSize: 22, color: Color.fromARGB(255, 82, 78, 66))),
                MyWidgets.backButton(context),
              ],
            ),
          ),
        ),
        const ListTile(
          leading: Icon(CupertinoIcons.person),
          title: Text("هەژمارەکەم"),
        ),
        GestureDetector(
          onTap: () {
            try {
              Authentication.signOut(context: context);
            } catch (e) {
              const SnackBar(content: Text("an error occured"));
            }
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const SigninScreen(),
                ),
              );
            });
          },
          child: const ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("چونەدەرەوە"),
          ),
        ),
      ],
    ));
  }
}
