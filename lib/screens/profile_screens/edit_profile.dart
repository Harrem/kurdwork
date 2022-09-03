import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurdwork/bloc/user_event.dart';
import 'package:kurdwork/bloc/user_state.dart';
import 'package:kurdwork/widgets/custom_widgets.dart';

import '../../bloc/user_bloc.dart';

//TODO: Add image croping option

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);
  @override
  Widget build(context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: 600,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.info),
                  )
                ],
              ),
              const Divider(),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return OvalPicture(
                      image: state is SetProfilePic
                          ? Image.file(File(state.platformFile.path!))
                          : Image.asset("assets/images/avatar.png"),
                      scale: 100);
                },
              ),
              const Divider(),
              OutlinedButton(
                onPressed: () async {
                  var result = await FilePicker.platform
                      .pickFiles(type: FileType.image, allowMultiple: false);
                  if (result != null) {
                    var platformFile = result.files[0];
                    debugPrint(platformFile.path);
                  }
                },
                child: const Text("Choose Picture"),
              ),
              const Divider(),
              const TextField(
                decoration: InputDecoration(labelText: "First Name"),
              ),
              const Divider(),
              const TextField(
                decoration: InputDecoration(labelText: "Last Name"),
              ),
              const Divider(),
              const TextField(
                decoration: InputDecoration(labelText: "Headline"),
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
