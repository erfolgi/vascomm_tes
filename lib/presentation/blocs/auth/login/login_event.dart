part of 'login_bloc.dart';

abstract class LoginEvent {}

class ValidateLoginEvent extends LoginEvent {}

class DoLoginEvent extends LoginEvent {}
class ChangeLoginStateEvent extends LoginEvent {}
