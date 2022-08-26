import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kurdwork/Models/job.dart';
import 'package:kurdwork/controller/time.dart';

import '../screens/jobViewScreen.dart';

class JobCard extends StatelessWidget {
  const JobCard({Key? key, required this.job}) : super(key: key);
  final Job job;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${TimeText.calculateReleaseDate(job.date)} ago",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.bookmark)),
                )
              ],
            ),
            const Divider(color: Colors.transparent),
            Padding(
              padding:
                  const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 3),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.info, color: Colors.grey[600], size: 18),
                  const VerticalDivider(thickness: 0.2, width: 3),
                  Text(
                    "Description: ",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                job.description.length >= 200
                    ? "${job.description.substring(0, 200)}..."
                    : job.description,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Icon(CupertinoIcons.briefcase_fill,
                          color: Colors.grey),
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        child: const Text("Experience",
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 30,
                        child: Text(job.experience),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(CupertinoIcons.clock_fill, color: Colors.grey),
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        child: const Text("Duration",
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        child: Text(job.type),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(CupertinoIcons.location_solid,
                          color: Colors.grey),
                      Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 25,
                        child: const Text("Location",
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 30,
                        child: Text(job.location),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        job.owner,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JobDetailScreen(job: job),
                        ),
                      );
                    },
                    child: const Text("see more"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {Key? key, required this.text, required this.body, this.trailing})
      : super(key: key);
  final String text;
  final Widget body;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing ?? const Text(""),
                ],
              ),
              Divider(color: Colors.grey[100]),
              const SizedBox(height: 10),
              body,
            ],
          ),
        ),
      ),
    );
  }
}
