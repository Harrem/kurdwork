// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kurdwork/services/jobServices.dart';
import '../Models/job.dart';
import '../myWidgets.dart';

class JobPost extends StatefulWidget {
  JobPost({Key? key, required this.user}) : super(key: key);
  User user;
  @override
  State<JobPost> createState() => _JobPostState();
}

class _JobPostState extends State<JobPost> {
  late final User user;

  JobServices jobServices = JobServices();
  PostForm form = PostForm();

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: form,
          ),
          Container(
            color: const Color.fromARGB(255, 250, 250, 250),
            width: double.infinity,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyWidgets.h1("دروستکرندی کار"),
                  MyWidgets.backButton(context),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  if (form.formKey.currentState!.validate()) {
                    Job job = Job(
                      title: form.jobTitleController.value.text,
                      workplace: form.jobWorkPlaceController.text,
                      location: form.jobLocatoinController.text,
                      type: form.jobTypeController.text,
                      description: form.jobDescriptionController.text,
                      date: DateTime.fromMicrosecondsSinceEpoch(
                          DateTime.now().microsecondsSinceEpoch),
                      //TODO: add a field to select the deadline for the post
                      deadline: DateTime.now()
                          .add(const Duration(days: 10))
                          .toIso8601String(),
                      experience: "زیاتر لە ٥ ساڵ",
                      owner: await FirebaseFirestore.instance
                          .collection("users")
                          .doc(user.uid.toString())
                          .get()
                          .then((value) => value.data()!['fname']),
                    );

                    jobServices.postJob(job);
                  }
                },
                child: const Text("post job"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostForm extends StatelessWidget {
  PostForm({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController jobWorkPlaceController = TextEditingController();
  TextEditingController jobLocatoinController = TextEditingController();
  TextEditingController jobTypeController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text("ناوی کار"),
            const SizedBox(height: 6),
            TextFormField(
              controller: jobTitleController,
              decoration: const InputDecoration(
                hintText: "ناوی کار بنووسە",
              ),
            ),
            const SizedBox(height: 20),
            const Text("شوێنی کار"),
            const SizedBox(height: 6),
            TextFormField(
              controller: jobWorkPlaceController,
              decoration: const InputDecoration(
                hintText: "شوێنی کار هەڵبژێرە",
              ),
            ),
            const SizedBox(height: 20),
            const Text("شوێنی ئیشکردن"),
            const SizedBox(height: 6),
            TextFormField(
              controller: jobLocatoinController,
              decoration: const InputDecoration(
                hintText: "شوێنی ئیشکردن هەلبژێرە",
              ),
            ),
            const SizedBox(height: 20),
            const Text("جۆری کار"),
            const SizedBox(height: 6),
            TextFormField(
              controller: jobTypeController,
              decoration: const InputDecoration(
                hintText: "جۆری کار هەڵبژێرە",
              ),
            ),
            const SizedBox(height: 20),
            const Text("دەربارەی کار"),
            const SizedBox(height: 6),
            TextFormField(
              controller: jobDescriptionController,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: "زانیاری دەربارەی کار بنووسە",
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
