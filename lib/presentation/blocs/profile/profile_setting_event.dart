part of 'profile_setting_bloc.dart';

@immutable
abstract class ProfileSettingEvent {}
class ChangeStateEvent extends ProfileSettingEvent {}
class ValidateEvent extends ProfileSettingEvent {}
