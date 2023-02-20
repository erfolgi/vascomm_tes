import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:vascomm_tes/core/util/app_preference.dart';
import 'package:vascomm_tes/data/models/auth/login/login_body.dart';
import 'package:vascomm_tes/di/di_object.dart';
import 'package:vascomm_tes/domain/use_cases/auth/auth_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthUseCase useCase = AuthUseCase(DIObject.authRepository);
  bool _isUsernameEmpty = false;
  bool get isUsernameEmpty => _isUsernameEmpty;
  final emailCtrl = TextEditingController();

  bool _isPasswordEmpty = false;
  bool get isPasswordEmpty => _isPasswordEmpty;
  final pwCtrl = TextEditingController();
  bool isPasswordHidden = true;

  bool isLoading = false;
  Map<String, dynamic> body = {};

  LoginBloc() : super(InitState()) {

    on<ChangeLoginStateEvent>((event, emit) => emit(InitState()));

    on<ValidateLoginEvent>((event, emit) {
      if (emailCtrl.text != "") {
        _isUsernameEmpty = false;
      }
      if (pwCtrl.text != "") {
        _isPasswordEmpty = false;
      }
      if (emailCtrl.text == "") {
        _isUsernameEmpty = true;
      }
      if (pwCtrl.text == "") {
        _isPasswordEmpty = true;
      }

      emit(InitState());
    });

    on<DoLoginEvent>((event, emit) async {
      if (emailCtrl.text != "" && pwCtrl.text != "") {
        final body = LoginBody(
          email: emailCtrl.text,
          password: pwCtrl.text,
        );
        final result = await useCase.login(body);
        if (result.networkError != null) {
          emit(ShowErrorNetworkState(result.networkError ?? ""));
        } else if (result.message != null) {
          emit(ShowErrorState(result.message ?? ""));
        } else if (result.unauthorized != null) {
          emit(ShowErrorState(result.unauthorized ?? ""));
        } else {
          if(result.data?.token!=null){
            await AppPreference.setToken(result.data?.token ?? "");
            emit(SuccessState());
          }else{
            emit(ShowErrorState(result.data?.error ?? "Oops, something wrong."));
          }

        }
      } else {
        add(ValidateLoginEvent());
      }
    });
  }
}
