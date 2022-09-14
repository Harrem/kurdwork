import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurdwork/widgets/custom_widgets.dart';

import '../../bloc/user_bloc/user_bloc.dart';
import '../../bloc/user_bloc/user_event.dart';
import '../../bloc/user_bloc/user_state.dart';

//TODO: Add image croping option

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final headlineController = TextEditingController();
  PlatformFile? profilePic;
  @override
  Widget build(context) {
    var userBloc = context.read<UserBloc>();
    fnameController.text = userBloc.userData.fname ?? '';
    lnameController.text = userBloc.userData.lname ?? '';
    headlineController.text = userBloc.userData.headline ?? '';

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
              //Profile Picture
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is ProfilePictureUpdated) {
                    debugPrint("profile notified");
                    return OvalPicture(
                      image: Image.file(File(profilePic!.path!)),
                      scale: 100,
                    );
                  }
                  return OvalPicture(
                    image: Image.asset("assets/images/avatar3.png"),
                    scale: 100,
                  );
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
                    profilePic = platformFile;
                    // ignore: use_build_context_synchronously
                    context
                        .read<UserBloc>()
                        .add(UpdateProfilePicture(platformFile));
                  }
                },
                child: const Text("Choose Picture"),
              ),
              const Divider(),
              TextField(
                controller: fnameController,
                decoration: const InputDecoration(labelText: "First Name"),
              ),
              const Divider(),
              TextField(
                controller: lnameController,
                decoration: const InputDecoration(labelText: "Last Name"),
              ),
              const Divider(),
              TextField(
                controller: headlineController,
                decoration: const InputDecoration(labelText: "Headline"),
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () {
                  userBloc.userActions
                      .updateName(fnameController.text, lnameController.text);

                  userBloc.userActions.updateHeadline(headlineController.text);

                  if (profilePic != null) {
                    userBloc.userActions.updateProfilePic(profilePic!);
                  }
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
