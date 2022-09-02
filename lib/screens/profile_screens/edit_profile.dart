import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kurdwork/widgets/custom_widgets.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: 600,
          padding: const EdgeInsets.all(20),
          child: Expanded(
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
                OvalPicture(
                    image: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/kurdwork-99.appspot.com/o/Tdo51pb7JHg5cFvYJxsO3ju5fCi2%2FprofilePic.jpeg?alt=media&token=5a52e1d8-d268-4fdb-bf70-7f65d72be58f"),
                    scale: 100),
                const Divider(),
                OutlinedButton(
                  onPressed: () async {
                    var result = await FilePicker.platform
                        .pickFiles(type: FileType.image, allowMultiple: false);
                    if (result != null) {
                      var platformFile = result.files[0];
                      debugPrint(platformFile.path);

                      var user = FirebaseAuth.instance.currentUser!;
                      var storage = FirebaseStorage.instance;

                      var userStorageRef = storage.ref(
                          "${user.uid}/profilePic.${platformFile.extension}");
                      if (platformFile.path != null ||
                          platformFile.path!.isNotEmpty) {
                        File file = File(platformFile.path!);
                        await userStorageRef.putFile(file);
                      } else {
                        debugPrint("Failed to upload, file is null");
                      }
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
      ),
    );
  }
}
