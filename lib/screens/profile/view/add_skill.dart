import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurdwork/widgets/custom_widgets.dart';
import '../../bloc/user_bloc/user_bloc.dart';
import '../../bloc/user_bloc/user_event.dart';
import '../../bloc/user_bloc/user_state.dart';

class EditSkills extends StatelessWidget {
  EditSkills({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<String> skills;
    skills = context.read<UserBloc>().userData.skills ?? [];
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
                    child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        skills = context.read<UserBloc>().userData.skills ?? [];
                        if (state is SkillsUpdated) {
                          skills = state.skills;
                          return Wrap(
                            spacing: 15,
                            runSpacing: 15,
                            clipBehavior: Clip.hardEdge,
                            children: List.generate(
                              skills.length,
                              (index) => Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  CustomChip(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 7, 30, 5),
                                    label: Text(skills[index]),
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
                          );
                        }
                        return Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          clipBehavior: Clip.hardEdge,
                          children: List.generate(
                            (skills).length,
                            (index) => Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                CustomChip(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 7, 30, 5),
                                  label: Text((skills)[index]),
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
                        );
                      },
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
                      if (controller.text.isNotEmpty) {
                        debugPrint("Text is not empty");
                        String skill = controller.text;
                        skills.add(skill);
                        context.read<UserBloc>().add(UpdateSkills(skills));
                      } else {
                        debugPrint("Text is empty ");
                      }
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
