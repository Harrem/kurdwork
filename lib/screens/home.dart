import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kurdwork/myWidgets.dart';
import 'package:kurdwork/mockData/categoriesData.dart';
import 'package:kurdwork/mockData/users.dart';
import 'package:kurdwork/screens/jobPostScreen.dart';
import 'package:kurdwork/screens/savedJobsScreen.dart';
import 'package:kurdwork/screens/profile_screens/profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kurdwork/services/jobServices.dart';
import 'package:kurdwork/widgets/custom_card.dart';

import '../Models/job.dart';

//TODO: fix scroll bug

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late User user;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final tabController = TabController(length: 4, vsync: this);
  var currentIndex = 0;
  var index = 0;
  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser!;
    // job = getJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: SafeArea(
        bottom: false,
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            key: _scaffoldKey,
            body: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // topCategories(),
                      const SizedBox(height: 20),
                      // topDevs("title"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              hintText: "گەڕان",
                              prefixIcon: const Icon(CupertinoIcons.search),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  searchController.clear();
                                },
                                icon: const Icon(CupertinoIcons.multiply),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Jobs",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              height: 45,
                              width: 45,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          JobPost(
                                        user: user,
                                      ),
                                    ),
                                  );
                                },
                                child: const Icon(Icons.filter_list),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // JobDetailCard(job: job),
                      const SizedBox(height: 20),
                      FutureBuilder<List<Widget>>(
                          future: mostRecentJobs(),
                          builder: ((context, snapshot) {
                            if (snapshot.data != null) {
                              return Column(children: snapshot.data!);
                            }
                            if (snapshot.data == null) {
                              debugPrint("null");
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          })),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                SearchScreen(),
                SearchScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  // tabBackgroundColor: const Color.fromARGB(255, 242, 235, 255),
                  color: Colors.black,
                  tabs: const [
                    GButton(
                      icon: CupertinoIcons.briefcase,
                      text: 'Jobs',
                    ),
                    GButton(
                      icon: CupertinoIcons.heart,
                      text: 'Saved',
                    ),
                    GButton(
                      icon: CupertinoIcons.bell,
                      text: 'Notifications',
                    ),
                    GButton(
                      icon: CupertinoIcons.person,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: currentIndex,
                  onTabChange: (index) {
                    setState(() {
                      tabController.index = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget topCategories() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          MyWidgets.h1("پیشە باوەکان"),
          const Divider(color: Colors.transparent),
          SizedBox(
            child: Wrap(
              spacing: 15,
              runSpacing: 15,
              children: List.generate(
                7,
                (index) => index == 6
                    ? MyWidgets.cateCard(text: 'زیاتر')
                    : MyWidgets.cateCard(text: categories[index]['name']!),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget topDevs(String title) {
    // return Text("data");
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: MyWidgets.h1("باشترین گەشەپێدەرەکان"),
          ),
          const Divider(color: Colors.transparent),
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: MyWidgets.personHeads(
                      title: users[index]['fname'].toString(), radius: 70),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Widget>> mostRecentJobs() async {
    List<Widget> list = [];
    List<Job> jobs = await JobServices().getJobList();
    for (var e in jobs) {
      debugPrint("statement");
      list.add(JobCard(job: e));
      list.add(const SizedBox(height: 10));
    }
    return list;
  }
}
