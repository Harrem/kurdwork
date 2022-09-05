import 'package:file_picker/file_picker.dart';

abstract class UserEvents {}

class InitializeUser extends UserEvents {}

class UpdateUserData extends UserEvents {}

class UpdateProfilePicture extends UserEvents {
  final PlatformFile image;

  UpdateProfilePicture(this.image);
}

class UpdateAbout extends UserEvents {
  String data;

  UpdateAbout(this.data);
}

class UpdateSkills extends UserEvents {
  List<String> skills;

  UpdateSkills(this.skills);
}

class UpdateName extends UserEvents {
  String fname;
  String lname;

  UpdateName(this.fname, this.lname);
}

class UpdateEducation extends UserEvents {
  Map<String, String> education;

  UpdateEducation(this.education);
}

class UpdateHeadline extends UserEvents {
  String headline;

  UpdateHeadline(this.headline);
}

class UpdateLicensesAndCertifications {}

class UpdateCV extends UserEvents {}

class FirstTimeUser extends UserEvents {}
