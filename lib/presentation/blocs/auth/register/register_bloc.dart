import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:vascomm_tes/core/util/app_util.dart';
import 'package:vascomm_tes/data/models/text_field_validation.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  TextFieldValidation isEmailValid = TextFieldValidation(isValid: true);
  final emailCtrl = TextEditingController();

  TextFieldValidation isPasswordValid = TextFieldValidation(isValid: true);
  final passwordCtrl = TextEditingController();
  bool isPasswordHidden = true;

  TextFieldValidation isConfPasswordValid = TextFieldValidation(isValid: true);
  final confPasswordCtrl = TextEditingController();
  bool isConfPasswordHidden = true;

  TextFieldValidation isPhoneValid = TextFieldValidation(isValid: true);
  final phoneCtrl = TextEditingController();

  TextFieldValidation isKtpValid = TextFieldValidation(isValid: true);
  final ktpCtrl = TextEditingController();

  TextFieldValidation isFirstNameValid = TextFieldValidation(isValid: true);
  final firstNameCtrl = TextEditingController();

  TextFieldValidation isLastNameValid = TextFieldValidation(isValid: true);
  final lastNameCtrl = TextEditingController();

  Map<String, String> body = {};
  bool isLoading = false;

  RegisterBloc() : super(RegisterInitial()) {
    on<ValidateEvent>((event, emit) async {


      isFirstNameValid = AppUtil.isTextFieldValid(firstNameCtrl.text);
      isLastNameValid = AppUtil.isTextFieldValid(lastNameCtrl.text);

      isKtpValid = AppUtil.isTextFieldValid(ktpCtrl.text);

      isEmailValid = AppUtil.isTextFieldValid(emailCtrl.text);

      isPhoneValid = AppUtil.isTextFieldValid(phoneCtrl.text);

      isPasswordValid = AppUtil.isPasswordValid(passwordCtrl.text);
      isConfPasswordValid = AppUtil.isPasswordValid(confPasswordCtrl.text);


      if(passwordCtrl.text!=confPasswordCtrl.text){
        isPasswordValid=TextFieldValidation(isValid: false, message: "Password tidak sama");
        isConfPasswordValid=TextFieldValidation(isValid: false, message: "Password tidak sama");
      }
      emit(InitState());
      if(isFirstNameValid.isValid &&
      isLastNameValid.isValid &&

      isKtpValid.isValid &&

      isEmailValid.isValid &&

      isPhoneValid.isValid &&

      isPasswordValid.isValid &&
      isConfPasswordValid.isValid){
        //TODO
      }

    });
  }
}
