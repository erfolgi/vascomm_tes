
import 'package:vascomm_tes/core/util/resource.dart';
import 'package:vascomm_tes/data/models/auth/login/login_body.dart';
import 'package:vascomm_tes/data/models/auth/login/login_response.dart';
import 'package:vascomm_tes/domain/repositories/auth/auth_repository.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase(this.repository);

  Future<Resource<LoginResponse>> login(LoginBody body) {
    return repository.login(body: body);
  }
}