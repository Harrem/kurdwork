// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kurdwork/services/jobServices.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Models/job.dart';
import '../bloc/user_bloc/user_bloc.dart';

class JobPost extends StatefulWidget {
  const JobPost({
    Key? key,
  }) : super(key: key);
  @override
  State<JobPost> createState() => _JobPostState();
}

class _JobPostState extends State<JobPost> {
  JobServices jobServices = JobServices();
  PostForm form = PostForm();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<UserBloc>();
    return Container(
      color: Colors.blueGrey[50],
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(CupertinoIcons.back),
                      ),
                    ),
                    const VerticalDivider(),
                    Text(
                      "Post Job",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: form,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                width: double.infinity,
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
                        deadline: DateTime.now()
                            .add(const Duration(days: 10))
                            .toIso8601String(),
                        experience: form.experienceLevelController.text,
                        owner: await FirebaseFirestore.instance
                            .collection("users")
                            .doc(bloc.userData.uid.toString())
                            .get()
                            .then((value) => value.data()!['fname']),
                      );

                      jobServices.postJob(job);
                    }
                  },
                  child: const Text("Post"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostForm extends StatelessWidget {
  PostForm({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController jobWorkPlaceController = TextEditingController();
  final TextEditingController jobLocatoinController = TextEditingController();
  final TextEditingController jobTypeController = TextEditingController();
  final TextEditingController experienceLevelController =
      TextEditingController();
  final TextEditingController jobDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: jobTitleController,
              decoration: const InputDecoration(
                labelText: "Job Title",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: jobWorkPlaceController,
              decoration: const InputDecoration(
                labelText: "Job Location",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: jobLocatoinController,
              decoration: const InputDecoration(
                hintText: "Job WorkPlace",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: jobTypeController,
              decoration: const InputDecoration(
                hintText: "Job Type",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: experienceLevelController,
              decoration: const InputDecoration(
                hintText: "Experience Level",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: jobDescriptionController,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: "Job Description",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
