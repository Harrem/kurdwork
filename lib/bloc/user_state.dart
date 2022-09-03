import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

abstract class UserState {}

class UserInitState extends UserState {}

class SetProfilePic extends UserState {
  PlatformFile platformFile;
  SetProfilePic(this.platformFile) {
    setPhoto(platformFile);
  }

  Future<void> setPhoto(PlatformFile platformFile) async {
    var user = FirebaseAuth.instance.currentUser!;
    var storage = FirebaseStorage.instance;

    var userStorageRef =
        storage.ref("${user.uid}/profilePic.${platformFile.extension}");
    if (platformFile.path != null || platformFile.path!.isNotEmpty) {
      File file = File(platformFile.path!);

      await userStorageRef.putFile(file);
    } else {
      debugPrint("Failed to upload, file is null");
    }
  }
}
