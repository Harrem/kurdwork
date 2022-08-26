import 'package:flutter/material.dart';

class AddEducation extends StatelessWidget {
  const AddEducation({Key? key}) : super(key: key);

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
                    "Add Education",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Divider(
                    color: Colors.grey[200],
                  ),
                  const Divider(),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'school',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        hintText: "Ex. Charmo University"),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Dates Attended",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey[300],
                            hintText: 'Date Started',
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey[300],
                            hintText: 'Date Ended',
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Degree",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  const Divider(),
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        hintText: "Ex: Master of Computer Science"),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Field of study",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  const Divider(),
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        hintText: "Ex. Applied Computer Science"),
                  ),
                  const SizedBox(height: 30),
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
