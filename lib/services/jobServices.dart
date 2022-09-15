// ignore_for_file: file_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Data/Models/job.dart';

class JobServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Job>> getJobList() async {
    List<Job> jobs = [];

    QuerySnapshot<Map<String, dynamic>> jobList = await firestore
        .collection("jobs")
        .orderBy("date", descending: true)
        .get()
        .then((value) => value);
    for (var e in jobList.docs) {
      jobs.add(Job.fromMap(e.data()));
    }

    return jobs;
  }

  void postJob(Job job) {
    try {
      firestore
          .collection('jobs')
          .add(job.toMap())
          .timeout(const Duration(seconds: 5));
    } on TimeoutException catch (e) {
      debugPrint(e.toString());
    }
  }
}
