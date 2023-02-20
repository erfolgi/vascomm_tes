class LoginResponse {
  String? token;
  String? error;

  LoginResponse({this.token, this.error});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['error'] = error;
    return data;
  }
}
