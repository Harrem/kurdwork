import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget {
  BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Text("Saved ones"),
      ]),
    );
  }
}
