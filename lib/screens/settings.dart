import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kurdwork/myWidgets.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

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
      ],
    ));
  }
}
