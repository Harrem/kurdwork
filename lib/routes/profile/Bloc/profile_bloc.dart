import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurdwork/routes/profile/Bloc/profile_event.dart';
import 'package:kurdwork/routes/profile/Bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitState()) {
    on<InitializeProfile>(((event, emit) {
      emit(ProfileInitialized());
    }));
    on<UpdateProfilePic>(((event, emit) {}));
    on<UpdateName>(((event, emit) {}));
    on<UpdateHeadline>(((event, emit) {}));
    on<UpdateAbout>(((event, emit) {}));
    on<UpdateSkills>(((event, emit) {}));
    on<UpdateEducation>((((event, emit) {})));
  }
}
