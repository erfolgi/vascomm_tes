import 'package:get_it/get_it.dart';
import 'package:vascomm_tes/data/api/api_service.dart';
import 'package:vascomm_tes/data/repository/data_source_impl/auth/auth_data_source_impl.dart';
import 'package:vascomm_tes/data/repository/repository_impl/auth/auth_repository_impl.dart';
import 'package:vascomm_tes/domain/repositories/auth/auth_repository.dart';
import 'package:vascomm_tes/presentation/blocs/auth/login/login_bloc.dart';
import 'package:vascomm_tes/presentation/blocs/auth/register/register_bloc.dart';
import 'package:vascomm_tes/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:vascomm_tes/presentation/blocs/profile/profile_setting_bloc.dart';
import 'package:vascomm_tes/presentation/blocs/splash/splash_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DIObject {
  static void init(){
    final service = ApiService();

    /// Instance remote data sources here
    final authSource = AuthDataSourceImpl(service);
    ///-------------------------------------------------------------------------

    /// Instance repositories here
    final authRepo = AuthRepositoryImpl(authSource);
    ///-------------------------------------------------------------------------

    /// Inject the repositories
    GetIt.I.registerLazySingleton<AuthRepository>(() => authRepo);
    ///-------------------------------------------------------------------------

    /// Inject the blocs
    GetIt.I.registerFactory(() => SplashBloc());
    GetIt.I.registerFactory(() => LoginBloc());
    GetIt.I.registerFactory(() => RegisterBloc());
    GetIt.I.registerFactory(() => DashboardBloc());
    GetIt.I.registerFactory(() => ProfileSettingBloc());

    ///-------------------------------------------------------------------------
  }
 /// Define static getter of repositories
  static AuthRepository get authRepository => GetIt.I();
///----------------------------------------------------------------------///

  static Future<void> setPreference() async {
    final pref = await SharedPreferences.getInstance();
    GetIt.I.registerSingleton<SharedPreferences>(pref);
  }

  /// Define static getter of SharedPreferences instance
  static SharedPreferences get pref => GetIt.I();

  /// Define static getter of blocs
  static SplashBloc get splashBloc => GetIt.I();
  static LoginBloc get loginBloc => GetIt.I();
  static RegisterBloc get registerBloc => GetIt.I();
  static DashboardBloc get dashboardBloc => GetIt.I();
  static ProfileSettingBloc get profileSettingBloc => GetIt.I();
///----------------------------------------------------------------------///
}