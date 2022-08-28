import 'package:flutter/material.dart';
import 'package:kurdwork/widgets/custom_widgets.dart';

import '../../mockData/users.dart';

class AddSkill extends StatelessWidget {
  AddSkill({Key? key}) : super(key: key);
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Card(
          color: Colors.white,
          child: Container(
            color: Colors.amber,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Add New Skills",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Divider(color: Colors.grey[200]),
                Container(
                  width: double.infinity,
                  height: 228,
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
                          (users[0]['skills'] as List<String>).length,
                          (index) => Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              CustomChip(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 7, 30, 5),
                                label: Text((users[0]['skills']
                                    as List<String>)[index]),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove_circle,
                                  size: 20,
                                  color: Colors.redAccent,
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
                    SizedBox(
                      height: 44,
                      child: OutlinedButton(
                        onPressed: () {
                          String skill;
                          skill = controller.text;
                        },
                        child: const Text("Add"),
                      ),
                    ),
                    VerticalDivider(width: 10),
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
      ),
    );
  }
}
