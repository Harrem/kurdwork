import 'dart:io';

import 'package:file_picker/file_picker.dart';

abstract class UserEvents {}

class UpdateUserData extends UserEvents {}

class UpdateProfilePicture extends UserEvents {
  PlatformFile image;

  UpdateProfilePicture(this.image);
}
