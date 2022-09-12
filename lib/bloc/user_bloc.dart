import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurdwork/Models/user.dart';
import 'package:kurdwork/bloc/user_event.dart';
import 'package:kurdwork/bloc/user_state.dart';
import '../controller/user_actions.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  late UserData userData;
  UserActions userActions = UserActions();

  UserBloc() : super(UserInitState()) {
    on<InitializeUser>(((event, emit) async {
      debugPrint("Initializing User!");
      UserData? tempUserData = await userActions.initializeUser();
      if (tempUserData != null) {
        userData = tempUserData;
        emit(UserInitialized());
        debugPrint("User initialized!");
      } else {
        emit(UserNotInitialized());
        debugPrint("User did NOT initialize!");
      }
    }));

    on<UpdateProfilePicture>(((event, emit) async {
      try {
        var downloadUrl = await userActions.updateProfilePic(event.image);
        userData.profileUrl = downloadUrl;
        debugPrint(downloadUrl);
        if (userData.profileUrl != null) {
          debugPrint(userData.profileUrl);
          emit(ProfilePictureUpdated(userData.profileUrl!));
        } else {
          debugPrint("Profile image is null");
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }));

    on<UpdateAbout>(((event, emit) {
      userActions.updateAbout(event.data);
      emit(AboutUpdated(event.data));
    }));

    on<UpdateSkills>((event, emit) async {
      var skills = await userActions.updateSkills(event.skills);
      emit(SkillsUpdated(skills));
    });
  }
}
