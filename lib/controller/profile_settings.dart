import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:kurdwork/Models/user.dart' as model;
import 'package:kurdwork/mockData/userMockData.dart';

class UserActions {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<model.User> initializeUser() async {
    model.User user;
    var documnt =
        firestore.collection('users').doc(firebaseAuth.currentUser!.uid);
    var map = await documnt.get();
    if (map.data() != null) {
      user = model.User.fromMap(map.data()!);
      debugPrint("user initialized from live data ${map.data()!}");
    } else {
      user = model.User.fromJson(userMock.toString());
      debugPrint("user initialized from mock data! ${map.data()!}");
    }
    return user;
  }

  Future<void> checkFirstTimeUser(User user) async {
    var data = await firestore.collection("users").doc(user.uid).get();
    if (data.data() != null || data.data()!.isEmpty) {
      debugPrint("!!!!!!!!!!!!!!!     is First Time user      !!!!!!!!!!!!!");
    }
  }

  Future<void> updateName(String fname, String lname, String uid) async {
    firestore
        .collection('users')
        .doc(uid)
        .set({'fname': fname, 'lname': lname});
  }

  Future<void> updateHeadline(String headline, String uid) async {
    firestore.collection('users').doc(uid).set({'headline': headline});
  }

  Future<void> updateAbout(String about, String uid) async {
    firestore.collection('users').doc(uid).set({'about': about});
  }

  /// Upload Profile picture to Firebase Storage
  Future<void> updateProfilePic(PlatformFile platformFile, String uid) async {
    var userStorageRef =
        firebaseStorage.ref("$uid/profilePic.${platformFile.extension}");
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
