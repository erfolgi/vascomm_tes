import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vascomm_tes/core/config/asset_string.dart';
import 'package:vascomm_tes/di/di_object.dart';
import 'package:vascomm_tes/presentation/auth/login/login_screen.dart';
import 'package:vascomm_tes/presentation/dashboard/dashboard_screen.dart';

import '../blocs/splash/splash_bloc.dart';

class SplashScreen extends StatefulWidget {

  static const routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _bloc = DIObject.splashBloc;

  @override
  void initState() {
    super.initState();
    _bloc.add(CheckSessionEvent());
  }
  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: _bloc,
        builder: (ctx, state) {
          if (state is GoToLogin) {
            Future.delayed(const Duration(milliseconds: 1500), () {
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              //LoginScreen.routeName
            });
          } else if (state is GoToDashboard) {
            Future.delayed(const Duration(milliseconds: 1500), () {
             Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
            });
          }
          return Stack(
            children: [
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                top: 0,
                child: Hero(
                  tag: AssetString.icVaccine,
                  child: Image.asset(
                    AssetString.icVaccine,
                    width: 110,
                    height: 100,
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}