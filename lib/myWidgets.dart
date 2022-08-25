import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  static Widget myElevatedButton(
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
            elevation: 1,
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

  static Widget cateCard({String text = "", double width = 10.0}) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
            Text(text, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
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
              ),
            ]),
      ),
    );
  }
}

// Text(
//                     description.length > 300
//                         ? "${description.substring(0, 300)}..."
//                         : description,
//                   ),
