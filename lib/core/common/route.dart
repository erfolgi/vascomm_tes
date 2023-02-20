import 'package:flutter/material.dart';
import 'package:vascomm_tes/presentation/auth/login/login_screen.dart';
import 'package:vascomm_tes/presentation/auth/register/register_screen.dart';
import 'package:vascomm_tes/presentation/dashboard/dashboard_screen.dart';
import 'package:vascomm_tes/presentation/profile/profile_setting_screen.dart';
import 'package:vascomm_tes/presentation/splash/splash_screen.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routeNames(BuildContext context) {
    return {
      SplashScreen.routeName: (context) => const SplashScreen(),
      LoginScreen.routeName: (context) => const LoginScreen(),
      RegisterScreen.routeName: (context) => const RegisterScreen(),
      DashboardScreen.routeName: (context) => const DashboardScreen(),
      ProfileSettingScreen.routeName: (context) => const ProfileSettingScreen(),
    };
  }
}