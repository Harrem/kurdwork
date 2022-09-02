import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum UserEvent { updateUserData, updateProfilePic }

class UserBloc extends Bloc<UserEvent, User> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User user;
  UserBloc(this.user) : super(user);
  Stream<User> mapEventToState(UserEvent event) async* {
    switch (event) {
      case UserEvent.updateUserData:
        yield updateUserData(state);
        break;
      case UserEvent.updateProfilePic:
        yield state;
        break;
    }
  }

  User updateUserData(User user) {
    user = firebaseAuth.currentUser!;
    return user;
  }

  Future<void> updateProfilePic(PlatformFile platformFile) async {
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
