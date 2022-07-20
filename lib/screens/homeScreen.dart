// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:kurdwork/mockData/jobs.dart';
import 'package:kurdwork/myWidgets.dart';
import 'package:kurdwork/mockData/categoriesData.dart';
import 'package:kurdwork/mockData/users.dart';
import 'package:kurdwork/screens/signinScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "کوردوۆرک",
            style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.5,
          actions: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.bell),
              ),
            )
          ]),
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
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              topCategories(),
              const SizedBox(
                height: 20,
              ),
              topDevs("title"),
              const SizedBox(height: 20),
              mostRecentJobs(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 1,
        mini: false,
        child: const Icon(Icons.add, size: 30),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(CupertinoIcons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.square_favorites_alt),
                onPressed: () {},
              ),
              const Divider(),
              IconButton(
                icon: const Icon(CupertinoIcons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.settings),
                onPressed: () {},
              ),
            ],
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
        child:
            MyWidgets.h1("نوێترین هەلی کارەکان", fontWeight: FontWeight.bold),
      ),
    ];
    List.generate(jobs.length, (index) {
      var e = MyWidgets.myCard(
        title: jobs[index]['title']!,
        subtitle: jobs[index]['owner']!,
        description: jobs[index]['description']!,
      );
      list.add(e);
      list.add(const Divider(
        color: Colors.grey,
        height: 0,
      ));
      return e;
    });
    // list.addAll(list2);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: list);
  }
}
