import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:kurdwork/Models/user.dart';

///User common actions like
///updating profile info and picture
class UserActions {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  late DocumentReference<Map<String, dynamic>> docRef;

  ///Initailize userData
  ///if userData is null, it returns null.
  Future<UserData?> initializeUser() async {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    docRef = FirebaseFirestore.instance.collection('users').doc(uid);
    UserData? userData;
    var map = await docRef.get();
    if (map.data()!.entries.isNotEmpty) {
      userData = UserData.fromMap(map.data()!);
      debugPrint("user data initialized, data: ${map.data()!.entries}");
    } else {
      debugPrint("!!!!!!!!!!!!!!!     is First Time user      !!!!!!!!!!!!!");
    }
    return userData;
  }

  Future<UserData> updateUserData() async {
    final String uid = FirebaseAuth.instance.currentUser!.uid;

    return UserData(uid: uid);
  }

  ///Creates a new UserData and returns it
  Future<UserData> createProfile() async {
    final String uid = FirebaseAuth.instance.currentUser!.uid;

    return UserData(uid: uid);
  }

  ///Updates user first name and lastname
  Future<void> updateName(String fname, String lname) async {
    docRef.set({'fname': fname, 'lname': lname});
  }

  ///updates user headline (appers under user name)
  Future<void> updateHeadline(String headline) async {
    docRef.set({'headline': headline});
  }

  ///updates user about data
  Future<void> updateAbout(String about) async {
    docRef.set({'about': about});
  }

  /// updates user Profile picture and uploads it to firestore
  Future<void> updateProfilePic(PlatformFile platformFile) async {
    final String uid = FirebaseAuth.instance.currentUser!.uid;

    //profile picture path on firebase storage
    String storageRef = "$uid/profilePic.${platformFile.extension}";

    var userStorageRef = firebaseStorage.ref(storageRef);

    if (platformFile.path != null || platformFile.path!.isNotEmpty) {
      File file = File(platformFile.path!);
      try {
        await userStorageRef.putFile(file);
      } catch (e) {
        Future.error(e.toString());
      }
    } else {
      debugPrint("Failed to upload, file is null");
    }
  }
}
