import 'package:vascomm_tes/data/api/api_service.dart';
import 'package:vascomm_tes/data/models/auth/login/login_body.dart';
import 'package:vascomm_tes/data/models/auth/login/login_response.dart';
import 'package:vascomm_tes/data/repository/data_source/auth/auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {

  final ApiService service;

  AuthDataSourceImpl(this.service);

  @override
  Future<LoginResponse> login({required LoginBody body}) {
    return service.login(body: body);
  }
}