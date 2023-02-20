part of 'login_bloc.dart';

abstract class LoginState {}

class InitState extends LoginState {}

class ShowLoadingState extends LoginState {}

class GoToFormState extends LoginState {}

class SuccessState extends LoginState {}

class ShowErrorState extends LoginState {
  String message;
  ShowErrorState(this.message);
}

class ShowErrorNetworkState extends LoginState {
  String message;
  ShowErrorNetworkState(this.message);
}