import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:vascomm_tes/core/util/app_util.dart';
import 'package:vascomm_tes/data/models/text_field_validation.dart';

part 'profile_setting_event.dart';
part 'profile_setting_state.dart';

class ProfileSettingBloc extends Bloc<ProfileSettingEvent, ProfileSettingState> {
  TextFieldValidation isEmailValid = TextFieldValidation(isValid: true);
  final emailCtrl = TextEditingController();

  TextFieldValidation isPhoneValid = TextFieldValidation(isValid: true);
  final phoneCtrl = TextEditingController();

  TextFieldValidation isKtpValid = TextFieldValidation(isValid: true);
  final ktpCtrl = TextEditingController();

  TextFieldValidation isFirstNameValid = TextFieldValidation(isValid: true);
  final firstNameCtrl = TextEditingController();

  TextFieldValidation isLastNameValid = TextFieldValidation(isValid: true);
  final lastNameCtrl = TextEditingController();

  ProfileSettingBloc() : super(InitState()) {

    on<ValidateEvent>((event, emit) async {


      isFirstNameValid = AppUtil.isTextFieldValid(firstNameCtrl.text);
      isLastNameValid = AppUtil.isTextFieldValid(lastNameCtrl.text);

      isKtpValid = AppUtil.isTextFieldValid(ktpCtrl.text);

      isEmailValid = AppUtil.isTextFieldValid(emailCtrl.text);

      isPhoneValid = AppUtil.isTextFieldValid(phoneCtrl.text);


      emit(InitState());
      if(isFirstNameValid.isValid &&
          isLastNameValid.isValid &&

          isKtpValid.isValid &&

          isEmailValid.isValid &&

          isPhoneValid.isValid ){
        //TODO
      }

    });
  }
}
