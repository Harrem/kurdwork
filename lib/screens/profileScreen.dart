import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kurdwork/mockData/users.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 240, 240, 240),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Image.asset("assets/images/1.jpg"),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/avatar2.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                      const VerticalDivider(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${users[0]['fname']} ${users[0]['lname']}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "@${users[0]['username'].toString()}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    users[0]['bio'].toString(),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 30),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40,
                          width: 230,
                          child: TabBar(
                            tabs: [
                              Text(
                                "زانیاری کەسی",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                "نمونەی کار",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: TabBarView(
                            children: [
                              SizedBox(
                                height: 100,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          const Text("ئیمەیل: "),
                                          Text(users[0]['email'].toString()),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("ژمارە مۆبایل: "),
                                          Text(users[0]['phoneNo'].toString())
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("لەدایکبوون: "),
                                          Text(users[0]['birthdate'].toString())
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("ڕەیتینگ"),
                                          Text(users[0]['rating'].toString())
                                        ],
                                      ),
                                    ]),
                              ),
                              const Expanded(
                                child: Text(""),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    ));
  }
}
