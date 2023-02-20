import 'package:flutter/cupertino.dart';
import 'package:vascomm_tes/data/api/http_helper.dart';
import 'package:vascomm_tes/data/api/url_helper.dart';
import 'package:vascomm_tes/data/models/auth/login/login_body.dart';
import 'package:vascomm_tes/data/models/auth/login/login_response.dart';

class ApiService extends HttpHelper {
  /// Auth
  Future<LoginResponse> login({required LoginBody body}) async {

    final map = await postMethod(URL.login,
        body: body, header: {});
    return LoginResponse.fromJson(map);
  }
}