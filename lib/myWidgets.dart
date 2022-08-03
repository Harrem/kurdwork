// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kurdwork/main.dart';
import 'package:kurdwork/screens/jobViewScreen.dart';

class MyWidgets {
  static Widget h1(
    String text, {
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 22,
    TextAlign textAlign = TextAlign.start,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  static Widget h2(
    String text, {
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 18,
    TextAlign textAlign = TextAlign.start,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  static Widget h3(
    String text, {
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 16,
    TextAlign textAlign = TextAlign.start,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  static Widget outlineButton({icon, text = "button", onPressed}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      width: 220,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(Colors.grey),
            elevation: MaterialStateProperty.all(10),
          ),
          child: ListTile(
            title: Text(
              text,
              style: const TextStyle(color: Colors.grey),
            ),
            leading: icon,
          ),
        ),
      ),
    );
  }

  static Widget myTextField(context,
      {String labelText = "InputField",
      double width = double.infinity,
      onChanged}) {
    return SizedBox(
      width: width,
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          floatingLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  static Widget backButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: const Icon(
          CupertinoIcons.back,
          textDirection: TextDirection.ltr,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  static Widget myElevatedButton(context,
      {String text = "button",
      onPressed,
      double width = double.infinity,
      double height = 55}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              // primary: Color.fromARGB(255, 28, 126, 255),
              ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
  // static Widget myElevateButton(context,
  //     {String text = "button",
  //     onPressed,
  //     double width = 250,
  //     double height = 60}) {
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(12),
  //     child: SizedBox(
  //       width: width,
  //       height: height,
  //       child: ElevatedButton(
  //         onPressed: onPressed,
  //         child: Text(
  //           text,
  //           style: const TextStyle(fontSize: 20, color: Colors.white),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static Widget cateCard({String text = "", double width = 10.0}) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.deepPurple,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(text,
            style: const TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }

  static Widget personHeads(
      {String title = 'ناوی کەس', String? imgPath, double radius = 50}) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: radius,
            height: radius,
            decoration: ShapeDecoration(
              color: Colors.grey[400],
              shape: const CircleBorder(
                side: BorderSide.none,
              ),
            ),
            child: Center(
              child: imgPath == ""
                  ? Image.network(imgPath!)
                  : Image.asset(
                      "assets/images/avatar3.png",
                      width: double.maxFinite,
                    ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(title, textAlign: TextAlign.center)
      ],
    );
  }

  static Widget myExpansionTile(
      {String title = "ناوی کار",
      required int index,
      String subtitle = "خاوەن کارەکە",
      String description = "زانیاری کار",
      double width = double.infinity}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: ExpansionTile(
            title: Text(title),
            subtitle: Text(subtitle),
            expandedAlignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  description.length > 300
                      ? "${description.substring(0, 300)}..."
                      : description,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text("زیاتر بزانە"),
                ),
              )
            ]),
      ),
    );
  }

  static String timePosted(releaseTime) {
    var measuredTime =
        (DateTime.now().difference(DateTime.parse("$releaseTime")));

    if (measuredTime.inHours < 1) {
      return "${measuredTime.inMinutes} دەقە ";
    }
    if (measuredTime.inHours < 24) {
      return "${measuredTime.inHours} کاتژمێر ";
    }
    if (measuredTime.inHours >= 24) {
      return "${measuredTime.inDays} ڕۆژ ";
    }
    return measuredTime.inHours.toString();
  }

  static Widget myCard(BuildContext context,
      {required Map<String, dynamic> map, double width = double.infinity}) {
    String title = map['title'];
    String subtitle = map['owner'];
    String description = map['description'];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${MyWidgets.timePosted("${map["date"]} ${map["time"]}")} لەمەوبەر",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {}, icon: Icon(CupertinoIcons.bookmark)),
              )
            ],
          ),
          const Divider(color: Colors.transparent),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.info, color: Colors.grey[600], size: 18),
                VerticalDivider(
                  thickness: 0.2,
                  width: 3,
                ),
                Text(
                  "زانیاری کار",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10.0),
            child: Text(
              description.length >= 200
                  ? "${description.substring(0, 200)}..."
                  : description,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(CupertinoIcons.briefcase_fill, color: Colors.grey),
                    Container(
                      alignment: Alignment.center,
                      height: 25,
                      child: Text("ئەزموون",
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 30,
                      child: Text("زیاتر لە ٥ ساڵ"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(CupertinoIcons.timer_fill, color: Colors.grey),
                    Container(
                      alignment: Alignment.center,
                      height: 25,
                      child: Text("کات",
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      child: Text("Part-Time"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(CupertinoIcons.location_fill, color: Colors.grey),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 25,
                      child: Text("شوێن",
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 30,
                      child: Text("هەولێر"),
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/avatar3.png",
                        width: 50,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10.0,
                      left: 10.0,
                    ),
                    child: Text(
                      subtitle,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobViewerScreen(map: map),
                      ),
                    );
                  },
                  child: const Text("زیاتر بزانە"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// Text(
//                     description.length > 300
//                         ? "${description.substring(0, 300)}..."
//                         : description,
//                   ),