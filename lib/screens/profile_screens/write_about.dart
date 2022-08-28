import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    "About",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Divider(
                    color: Colors.grey[200],
                  ),
                  TextField(
                    maxLines: 6,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        hintText: "Write a brief paragraph about yourself"),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                      const VerticalDivider(),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Done")),
                    ],
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
