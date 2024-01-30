part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoadingState extends UserState {}

final class UserLoadedState extends UserState {
  final UserModel userObj;

  const UserLoadedState({required this.userObj});

  @override
  List<Object> get props => [userObj];
}

final class UserErrorState extends UserState {
  final String errorMsg;

  const UserErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
