

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/auth/get_user.dart';
import 'package:spotify/presentation/profile/bloc/profile_info_state.dart';

import '../../../service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoLoading());

  void getUser() async {
    final user = await sl<GetUserUseCase>().call();
    user.fold(
      (l) => emit(ProfileInfoFailure()),
      (userEntity) => emit(ProfileInfoLoaded(userEntity: userEntity)),
    );
  }
}