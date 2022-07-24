// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:kurdwork/mockData/jobs.dart';
import 'package:kurdwork/myWidgets.dart';
import 'package:kurdwork/mockData/categoriesData.dart';
import 'package:kurdwork/mockData/users.dart';
import 'package:kurdwork/screens/searchScreen.dart';
import 'package:kurdwork/screens/signinScreen.dart';
import 'package:kurdwork/screens/profileScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color.fromARGB(255, 240, 240, 240),
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: const Text(
        //     "کوردوۆرک",
        //     style: TextStyle(
        //         color: Colors.deepPurple,
        //         fontSize: 20,
        //         fontWeight: FontWeight.normal),
        //   ),
        //   toolbarHeight: 50,
        //   backgroundColor: Colors.white,
        //   foregroundColor: Colors.black,
        //   elevation: 0.5,
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.all(6.0),
        //       child: IconButton(
        //         onPressed: () {},
        //         icon: const Icon(CupertinoIcons.bell),
        //       ),
        //     )
        //   ],
        // ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 150,
                child: DrawerHeader(
                  child: Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/avatar2.png",
                        width: 75,
                        height: 75,
                      ),
                    ),
                    const VerticalDivider(color: Colors.transparent),
                    SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyWidgets.h2(
                            "${users[0]['fname']} ${users[0]['lname']}",
                          ),
                          MyWidgets.h3("${users[0]['username'].toString()}@",
                              color: Colors.grey,
                              textAlign: TextAlign.left,
                              fontSize: 15),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              ListTile(
                title: const Text(
                  'پرۆفایل',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                leading: const Icon(
                  CupertinoIcons.person,
                  size: 30,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'جۆرەکانی کار',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                leading: const Icon(
                  CupertinoIcons.list_bullet_indent,
                  size: 30,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'هەڵگیراوەکان',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                leading: const Icon(
                  CupertinoIcons.bookmark,
                  size: 30,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'ڕێکخستنەکان',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                leading: const Icon(
                  CupertinoIcons.settings,
                  size: 30,
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'چوونەدەرەوە',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                leading: const Icon(
                  Icons.logout_rounded,
                  size: 30,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SigninScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: Tab(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  // topCategories(),
                  // const SizedBox(height: 20),
                  // topDevs("title"),
                  const SizedBox(height: 20),
                  mostRecentJobs(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: ((value) {
            setState(() {
              _currentIndex = value;
            });
            if (_currentIndex == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            }
          }),
          selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
          backgroundColor: const Color.fromARGB(255, 240, 240, 240),
          unselectedItemColor: Colors.grey[700],
          currentIndex: _currentIndex,
          showUnselectedLabels: false,
          enableFeedback: true,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_favorites_alt),
                label: "Saved"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), label: "Account"),
          ],
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
                  padding: const EdgeInsets.only(right: 8, left: 8),
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

  Widget mostRecentJobs() {
    List<Widget> list = [
      const Divider(color: Colors.transparent),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: MyWidgets.h1("نوێترین هەلی کار", fontWeight: FontWeight.bold),
      ),
    ];
    List.generate(jobs.length, (index) {
      var e = MyWidgets.myCard(context, map: jobs[index]);
      list.add(e);
      list.add(const Divider(
        color: Colors.grey,
        thickness: 0.2,
        height: 1,
      ));
      return e;
    });
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
  }
}
