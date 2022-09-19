import 'package:file_picker/file_picker.dart';

abstract class ProfileEvent {}

class InitializeProfile extends ProfileEvent {}

class UpdateProfilePic extends ProfileEvent {
  PlatformFile image;

  UpdateProfilePic(this.image);
}

class UpdateName extends ProfileEvent {
  final String name;

  UpdateName(this.name);
}

class UpdateHeadline extends ProfileEvent {
  final String headlineText;

  UpdateHeadline(this.headlineText);
}

class UpdateAbout extends ProfileEvent {
  final String aboutText;

  UpdateAbout(this.aboutText);
}

class UpdateSkills extends ProfileEvent {
  final List<String> skills;

  UpdateSkills(this.skills);
}

class UpdateEducation extends ProfileEvent {}
