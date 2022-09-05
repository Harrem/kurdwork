import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurdwork/Models/user.dart';
import 'package:kurdwork/bloc/user_event.dart';
import 'package:kurdwork/bloc/user_state.dart';
import '../controller/profile_settings.dart';

//TODO: check nullability of  user profile url

class UserBloc extends Bloc<UserEvents, UserState> {
  late User user;
  UserActions userActions = UserActions();

  UserBloc() : super(UserInitState()) {
    on<InitializeUser>(((event, emit) async {
      user = await userActions.initializeUser();
    }));

    on<UpdateProfilePicture>(((event, emit) {
      SetProfilePic(user.profileUrl);
    }));
  }
}
