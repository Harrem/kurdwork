import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

abstract class UserState {}

class UserInitState extends UserState {}

class SetProfilePic extends UserState {
  String? picUrl;
  SetProfilePic(this.picUrl);
}
