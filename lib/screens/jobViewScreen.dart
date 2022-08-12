// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kurdwork/myWidgets.dart';

import '../Models/job.dart';

@immutable
class JobViewerScreen extends StatefulWidget {
  final Job job;
  const JobViewerScreen({required this.job, Key? key}) : super(key: key);

  @override
  State<JobViewerScreen> createState() => _JobViewerScreenState(job);
}

class _JobViewerScreenState extends State<JobViewerScreen> {
  Job job;
  _JobViewerScreenState(this.job);

  String timePosted(releaseTime) {
    var measuredTime =
        (DateTime.now().difference(DateTime.parse("$releaseTime")));

    if (measuredTime.inHours < 1) {
      return "${measuredTime.inMinutes} دەقە ";
    }
    if (measuredTime.inHours < 24) {
      return "${measuredTime.inHours} کاتژمێر ";
    }
    if (measuredTime.inHours >= 24) {
      return "${measuredTime.inDays} ڕۆژ ";
    }
    return measuredTime.inHours.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyWidgets.h1("زانیاری کار"),
                          MyWidgets.backButton(context),
                        ]),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8),
                    child: Text(
                      job.title!,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 10),
                    child: Text(
                      "${timePosted(job.date)} لەمەوبەر",
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
                    child: Text(job.description!),
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
                              job.experience!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                              job.type!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                              job.location!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                          job.owner!,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
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
