import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 315,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  ElevatedButton(onPressed: () {}, child: const Text("Done")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
