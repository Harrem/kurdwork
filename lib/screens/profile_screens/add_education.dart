import 'package:flutter/material.dart';

class AddEducation extends StatelessWidget {
  const AddEducation({Key? key}) : super(key: key);

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
          height: 460,
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
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.grey[300],
                    labelText: 'School',
                    hintText: "Ex. Charmo University"),
              ),
              const Divider(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        labelText: "Dates Attended",
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
              const Divider(height: 20),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.grey[300],
                    labelText: "Degree",
                    hintText: "Ex: Master of Computer Science"),
              ),
              const Divider(height: 20),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.grey[300],
                    labelText: "Field of Studyhjdskf",
                    hintText: "Ex. Applied Computer Science"),
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
