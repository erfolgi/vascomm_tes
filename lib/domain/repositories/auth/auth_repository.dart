import 'package:vascomm_tes/core/util/resource.dart';
import 'package:vascomm_tes/data/models/auth/login/login_body.dart';
import 'package:vascomm_tes/data/models/auth/login/login_response.dart';

abstract class AuthRepository {
  Future<Resource<LoginResponse>> login({required LoginBody body});
}