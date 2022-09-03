import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurdwork/bloc/user_event.dart';
import 'package:kurdwork/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserBloc(super.initialState);

  Stream<UserState> mapEventToState(UserEvents event) async* {
    if (event is UpdateProfilePicture) {
      yield SetProfilePic(event.image);
    }
  }
}
