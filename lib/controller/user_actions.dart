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
  late String uid;

  ///Initailize userData
  ///if userData is null, it returns a null userdata.
  Future<UserData?> initializeUser() async {
    uid = FirebaseAuth.instance.currentUser!.uid;
    UserData? userData;

    docRef = FirebaseFirestore.instance.collection('users').doc(uid);
    var map = await docRef.get();
    if (map.data() == null) {
      debugPrint(
          "!!!!!!!!!!!!!!!     is First Time user   and null   !!!!!!!!!!!!!");
    } else if (map.data()!.entries.isNotEmpty) {
      userData = UserData.fromMap(map.data()!);
      debugPrint("user data initialized, data: ${map.data()!.entries}");
    } else {
      debugPrint("!!!!!!!!!!!!!!!     is First Time user      !!!!!!!!!!!!!");
    }

    return userData;
  }

  Future<UserData> updateUserData() async {
    return UserData(uid: uid);
  }

  ///Creates a new UserData and returns it
  Future<UserData> createProfile() async {
    return UserData(uid: uid);
  }

  ///Updates user first name and lastname
  Future<void> updateName(String fname, String lname) async {
    docRef.update({'fname': fname, 'lname': lname});
  }

  ///updates user headline (appers under user name)
  Future<void> updateHeadline(String headline) async {
    docRef.update({'headline': headline});
  }

  ///updates user about data
  Future<void> updateAbout(String about) async {
    await docRef.update({'about': about});
  }

  /// updates user Profile picture and uploads it to firestore
  Future<String?> updateProfilePic(PlatformFile platformFile) async {
    //profile picture path on firebase storage
    String storageRef = "$uid/profilePic.${platformFile.extension}";

    var userStorageRef = firebaseStorage.ref(storageRef);

    if (platformFile.path != null || platformFile.path!.isNotEmpty) {
      File file = File(platformFile.path!);
      try {
        var snapshot = await userStorageRef.putFile(file);
        if (snapshot.state == TaskState.running) {
          debugPrint("Uploading File");
        }
        if (snapshot.state == TaskState.error) {
          debugPrint("Upload Failed");
        }
        if (snapshot.state == TaskState.success) {
          debugPrint("File Uploaded!");
        }
        var downloadUrl = await userStorageRef.getDownloadURL();
        docRef.update({'profileUrl': downloadUrl});
        return downloadUrl;
      } catch (e) {
        Future.error("error");
        debugPrint("error when uplaoding picture");
      }
    } else {
      debugPrint("Failed to upload, file is null");
    }
    return null;
  }

  Future<List<String>> updateSkills(List<String> skills) async {
    await docRef.update({'skills': skills});
    return skills;
  }

  Future<void> updateData(UserData data) async {
    docRef.update(data.toMap());
  }
}
