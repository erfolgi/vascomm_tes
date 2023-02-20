part of 'register_bloc.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class InitState extends RegisterState {}
class ShowLoadingState extends RegisterState {}

class GoToFormLoginState extends RegisterState {}

class SuccessSubmitState extends RegisterState {}

class ShowErrorState extends RegisterState {
  String message;
  ShowErrorState(this.message);
}

class ShowErrorNetworkState extends RegisterState {
  String message;
  ShowErrorNetworkState(this.message);
}
class ShowErrorUnauthorizedState extends RegisterState {
  String message;
  ShowErrorUnauthorizedState(this.message);
}