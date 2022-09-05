import 'package:flutter/material.dart';
import 'package:kurdwork/widgets/custom_widgets.dart';

import '../../mockData/userMockData.dart';

class EditSkills extends StatelessWidget {
  EditSkills({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          alignment: Alignment.topCenter,
          height: 470,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Add New Skills",
                style: Theme.of(context).textTheme.headline6,
              ),
              Divider(color: Colors.grey[200]),
              Container(
                width: double.infinity,
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      clipBehavior: Clip.hardEdge,
                      children: List.generate(
                        (userMock['skills'] as List<String>).length,
                        (index) => Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            CustomChip(
                              padding: const EdgeInsets.fromLTRB(10, 7, 30, 5),
                              label: Text(
                                  (userMock['skills'] as List<String>)[index]),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove_circle,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.grey[100], hintText: "Add Skill"),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      String skill = controller.text;
                    },
                    child: const Text("Add"),
                  ),
                  const VerticalDivider(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Done"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
