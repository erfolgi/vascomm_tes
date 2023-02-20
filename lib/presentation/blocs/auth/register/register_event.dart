part of 'register_bloc.dart';

abstract class RegisterEvent {}
class ValidateEvent extends RegisterEvent {}

class ChangeStateEvent extends RegisterEvent {}

class DoSubmitEvent extends RegisterEvent {

}