// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kurdwork/myWidgets.dart';

import '../Models/job.dart';
import '../controller/time.dart';

@immutable
class JobDetailScreen extends StatefulWidget {
  final Job job;
  const JobDetailScreen({required this.job, Key? key}) : super(key: key);

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  late final Job job = widget.job;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(15),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: const Icon(CupertinoIcons.back),
                                ),
                              ),
                              const VerticalDivider(),
                              MyWidgets.h1("زانیاری کار"),
                            ]),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          job.title,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 10),
                        child: Text(
                          "${TimeText.calculateReleaseDate(job.date)} لەمەوبەر",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(CupertinoIcons.info_circle_fill,
                                color: Colors.grey, size: 20),
                            VerticalDivider(thickness: 0.2, width: 3),
                            Text(
                              "زانیاری کار",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(job.description),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Icon(
                                CupertinoIcons.briefcase_fill,
                                color: Colors.grey,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 25,
                                child: const Text("ئەزموون",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 30,
                                child: Text(
                                  job.experience,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                CupertinoIcons.time_solid,
                                color: Colors.grey,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 25,
                                child: const Text("کات",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                child: Text(
                                  job.type,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                CupertinoIcons.location_solid,
                                color: Colors.grey,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 25,
                                child: const Text("شوێن",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 30,
                                child: Text(
                                  job.location,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/images/avatar3.png",
                                width: 50,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10.0,
                              left: 10.0,
                            ),
                            child: Text(
                              job.owner,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 47,
                          width: 47,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const Icon(Icons.bookmark_add),
                          ),
                        ),
                        const VerticalDivider(),
                        SizedBox(
                          width: 250,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Apply"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
