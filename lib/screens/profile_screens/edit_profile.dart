import 'package:file_picker/file_picker.dart';
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
    var userBloc = context.read<UserBloc>();

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
              BlocListener<UserBloc, UserState>(
                listener: (context, state) {},
                child: OvalPicture(
                    image: userBloc.userData.profileUrl!.isNotEmpty
                        ? Image.network(userBloc.userData.profileUrl!)
                        : Image.asset("assets/images/avatar3.png"),
                    scale: 100),
              ),
              const Divider(),
              OutlinedButton(
                onPressed: () async {
                  var result = await FilePicker.platform
                      .pickFiles(type: FileType.image, allowMultiple: false);
                  if (result != null) {
                    var platformFile = result.files[0];
                    debugPrint(platformFile.path);
                    // ignore: use_build_context_synchronously
                    context
                        .read<UserBloc>()
                        .add(UpdateProfilePicture(platformFile));
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
