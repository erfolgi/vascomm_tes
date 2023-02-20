import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vascomm_tes/core/util/app_preference.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(InitState()) {

    on<CheckSessionEvent>((event, emit) {
      final token = AppPreference.apiToken;

      if (token != "") {
        emit(GoToDashboard());
      }else{
        emit(GoToLogin());
      }
    });

  }
}
