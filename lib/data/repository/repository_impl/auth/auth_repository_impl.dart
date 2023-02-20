import 'dart:convert';

import 'package:vascomm_tes/core/util/resource.dart';
import 'package:vascomm_tes/data/api/api_exception.dart';
import 'package:vascomm_tes/data/models/auth/login/login_body.dart';
import 'package:vascomm_tes/data/models/auth/login/login_response.dart';
import 'package:vascomm_tes/data/repository/data_source/auth/auth_data_source.dart';
import 'package:vascomm_tes/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {

  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<Resource<LoginResponse>> login({required LoginBody body}) async {
    try {
      final data = await dataSource.login(body: body);
      return Resource.success(data);
    } catch (ex) {
      if (ex is ErrorRequestException) {
        var message = jsonDecode(ex.errorBody);
        return Resource.error(
            message["message"], LoginResponse.fromJson(message));
      } else if (ex is UnauthorizedException) {
        var message = jsonDecode(ex.errorBody);
        return Resource.error(
            message["message"], LoginResponse.fromJson(message));
      } else if (ex is NetworkException) {
        return Resource.networkError("$ex");
      } else {
        return Resource.error("$ex");
      }
    }
  }
}