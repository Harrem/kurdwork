import 'package:flutter/material.dart';
import 'package:kurdwork/mockData/jobs.dart';
import 'package:kurdwork/mockData/users.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 400,
            child: Image.asset("assets/images/1.jpg"),
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/images/avatar2.png",
                  width: 100,
                  height: 100,
                ),
              ),
              Text(
                "${users[0]['fname']} ${users[0]['lname']}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ]),
      )),
    ));
  }
}
