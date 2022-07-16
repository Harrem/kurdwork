import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kurdwork/myWidgets.dart';
import 'package:kurdwork/mockData/categoriesData.dart';
import 'package:chip_list/chip_list.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

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
        title: const Text("سەرەکی", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              topCates(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 1,
        child: const Icon(Icons.camera_outlined),
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

  Widget topCates() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyWidgets.h1("پیشە باوەکان"),
          const Divider(color: Colors.transparent),
          SizedBox(
            height: 60,
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
}
