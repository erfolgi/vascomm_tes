import 'package:vascomm_tes/data/models/auth/login/login_body.dart';
import 'package:vascomm_tes/data/models/auth/login/login_response.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login({required LoginBody body});
}