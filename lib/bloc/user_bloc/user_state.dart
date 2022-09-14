import 'package:equatable/equatable.dart';
import 'package:kurdwork/Models/user.dart';

abstract class UserState extends Equatable {}

class UserInitState extends UserState {
  @override
  List<Object> get props => [];
}

class UserInitialized extends UserState {
  @override
  List<Object> get props => [];
}

class UserNotInitialized extends UserState {
  @override
  List<Object> get props => [];
}

class UserUpdated extends UserState {
  final UserData userData;
  UserUpdated(this.userData);

  @override
  List<Object> get props => [userData];
}

class ProfilePictureUpdated extends UserState {
  final String imageUrl;
  ProfilePictureUpdated(this.imageUrl);

  @override
  List<Object> get props => [imageUrl];
}

class AboutUpdated extends UserState {
  final String text;
  AboutUpdated(this.text);

  @override
  List<Object> get props => [text];
}

class SkillsUpdated extends UserState {
  final List<String> skills;
  SkillsUpdated(this.skills);

  @override
  List<Object> get props => [skills];
}
