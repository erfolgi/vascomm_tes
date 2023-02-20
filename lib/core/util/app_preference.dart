import 'package:vascomm_tes/di/di_object.dart';

abstract class PrefKey {
  static const apiToken = "api_token";
  static const dummyUser = "dummy_user";
  static const sharedModel = "shared_model";
}

class AppPreference {
  static Future<void> setToken(String token) async {
    await DIObject.pref.setString(PrefKey.apiToken, token);
  }

  static String get apiToken {
    return DIObject.pref.getString(PrefKey.apiToken) ?? "";
  }

  static void removeToken() async {
    await DIObject.pref.remove(PrefKey.apiToken);
  }

  static void logoutSession() {
    removeToken();
  }
}