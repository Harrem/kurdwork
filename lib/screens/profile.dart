import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kurdwork/mockData/users.dart';
import 'package:kurdwork/screens/settings.dart';
import 'package:kurdwork/widgets/custom_card.dart';
import 'package:kurdwork/widgets/custom_widgets.dart';

import '../mockData/categoriesData.dart';
import '../myWidgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.grey[100],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      Text(
                        "Profile",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      IconButton(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          OvalPicture(
                            image: Image.asset(
                              "assets/images/avatar3.png",
                            ),
                            scale: 70,
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
                            "Harrem M.",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            "Sulaymaniyah",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {},
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
                ProfileCard(
                  text: "Unity Developer",
                  body: const Text(
                      "Description about the user experties Description about the user experties Description about the user experties Description about the user experties "),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.pencil_circle,
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                ProfileCard(
                  text: "Skills",
                  body: SizedBox(
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: List.generate(
                        7,
                        (index) => index == 6
                            ? MyWidgets.cateCard(text: 'زیاتر')
                            : MyWidgets.cateCard(
                                text: categories[index]['name']!),
                      ),
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
                ProfileCard(
                  text: "Education",
                  body: const Text("Charmo University - Computer Science Bs"),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.pencil_circle,
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
                      CupertinoIcons.pencil_circle,
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                ProfileCard(
                  text: "User Links",
                  body: Column(children: const [Text("List of Links")]),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.pencil_circle,
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
                      CupertinoIcons.pencil_circle,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
