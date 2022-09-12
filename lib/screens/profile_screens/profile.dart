import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurdwork/Models/user.dart';
import 'package:kurdwork/bloc/user_bloc.dart';
import 'package:kurdwork/bloc/user_state.dart';
import 'package:kurdwork/mockData/userMockData.dart';
import 'package:kurdwork/screens/profile_screens/add_education.dart';
import 'package:kurdwork/screens/profile_screens/edit_profile.dart';
import 'package:kurdwork/screens/profile_screens/edit_userlinks.dart';
import 'package:kurdwork/screens/settings.dart';
import 'package:kurdwork/widgets/custom_card.dart';
import 'package:kurdwork/widgets/custom_widgets.dart';
import 'add_skill.dart';
import 'about.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UserData userData = BlocProvider.of<UserBloc>(context).userData;
    var userBloc = context.read<UserBloc>();
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserInitState) {}
        if (state is UserUpdated) {}
      },
      child: SafeArea(
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            padding: const EdgeInsets.all(2),
                            onPressed: () {},
                            icon: const Icon(Icons.search)),
                        Text(
                          "Profile",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        IconButton(
                          padding: const EdgeInsets.all(2),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Settings()),
                            );
                          },
                          icon: const Icon(CupertinoIcons.settings),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            BlocBuilder<UserBloc, UserState>(
                              builder: (context, state) {
                                if (state is ProfilePictureUpdated) {
                                  return OvalPicture(
                                    image: Image.network(state.imageUrl),
                                    scale: 70,
                                  );
                                }
                                return OvalPicture(
                                  image:
                                      Image.asset("assets/images/avatar3.png"),
                                  scale: 70,
                                );
                              },
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${userData.fname}  ${userData.lname}",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              userData.headline ?? "Headline",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditProfile()));
                              },
                              icon: const Icon(
                                CupertinoIcons.pencil_circle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  //TODO: add realtime Data
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is AboutUpdated) {
                        debugPrint("about notified!");
                        return ProfileCard(
                          text: "About",
                          body: Text(state.text),
                          trailing: IconButton(
                            onPressed: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) => About(),
                              );
                            },
                            icon: const Icon(
                              CupertinoIcons.pencil_circle,
                            ),
                          ),
                        );
                      }
                      return ProfileCard(
                        text: "About",
                        body: const Text("Write about yourself"),
                        trailing: IconButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) => About(),
                            );
                          },
                          icon: const Icon(
                            CupertinoIcons.pencil_circle,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 10),
                  ProfileCard(
                    text: "Skills",
                    body: SizedBox(
                      child: Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: List.generate(
                          (userData.skills ?? []).length,
                          (index) => index == 6
                              ? const CustomChip(
                                  label: Text("More"),
                                )
                              : CustomChip(
                                  label: Text((userData.skills
                                      as List<String>)[index])),
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) => EditSkills());
                      },
                      icon: const Icon(
                        CupertinoIcons.plus_circle,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  ProfileCard(
                    text: "Education",
                    body: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            ListTile(
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.pencil_circle)),
                              leading: const Icon(Icons.business_outlined),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("University Name"),
                                  Row(
                                    children: const [
                                      Text(
                                        "Degree, ",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text("Department",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 10,
                              color: Colors.grey[100],
                            ),
                          ],
                        );
                      }),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) => const AddEducation());
                      },
                      icon: const Icon(
                        CupertinoIcons.plus_circle,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  ProfileCard(
                    text: "Portfolio",
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.grey[300],
                          width: double.infinity,
                          height: 200,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 60,
                          alignment: Alignment.center,
                          child:
                              const Text("Showcase your work to win more jobs"),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.plus_circle,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  ProfileCard(
                    text: "User Links",
                    body: Column(children: const [Text("List of Links")]),
                    trailing: IconButton(
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (conterxt) => const EditUserLinks());
                      },
                      icon: const Icon(
                        CupertinoIcons.plus_circle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ProfileCard(
                    text: "Licenses & Certifications",
                    body: Column(
                      children: const [
                        Text("List of Licenses and Certifications"),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.plus_circle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ProfileCard(
                    text: "CV",
                    body: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Upload CV"),
                          ),
                        ],
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.pencil_circle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
