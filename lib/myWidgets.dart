import 'package:flutter/material.dart';

class MyWidgets {
  static Widget h1(String text, {Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25,
        color: color,
      ),
    );
  }

  static Widget h2(String text, {Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        color: color,
      ),
    );
  }

  static Widget h3(String text, {Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
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

  static Widget myElevatedButton(context,
      {String text = "button",
      onPressed,
      double width = 250,
      double height = 60}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
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
        color: Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(text,
            style: const TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}
