// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:state_with_bloc/models/user_model.dart';
import 'package:state_with_bloc/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  UserCubit(
    this.userRepository,
  ) : super(UserLoadingState());

  Future<void> userLoad() async {
    emit(UserLoadingState());
    try {
      UserModel userObj = await userRepository.getUsers();
      emit(UserLoadedState(userObj: userObj));
    } catch (e) {
      emit(UserErrorState(errorMsg: e.toString()));
    }
  }
}
