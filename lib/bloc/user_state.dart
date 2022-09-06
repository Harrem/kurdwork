abstract class UserState {}

class UserInitState extends UserState {}

class UserInitialized extends UserState {}

class UserNotInitialized extends UserState {}

class SetProfilePic extends UserState {
  String? picUrl;
  SetProfilePic(this.picUrl);
}
