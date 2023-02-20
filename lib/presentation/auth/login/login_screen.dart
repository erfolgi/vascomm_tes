import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vascomm_tes/core/config/app_color.dart';
import 'package:vascomm_tes/core/config/app_typography.dart';
import 'package:vascomm_tes/core/config/asset_string.dart';
import 'package:vascomm_tes/core/config/dimens.dart';
import 'package:vascomm_tes/core/util/app_util.dart';
import 'package:vascomm_tes/di/di_object.dart';
import 'package:vascomm_tes/presentation/auth/banner_view.dart';
import 'package:vascomm_tes/presentation/auth/footer_view.dart';
import 'package:vascomm_tes/presentation/auth/register/register_screen.dart';
import 'package:vascomm_tes/presentation/blocs/auth/login/login_bloc.dart';
import 'package:vascomm_tes/presentation/dashboard/dashboard_screen.dart';
import 'package:vascomm_tes/presentation/widgets/app_button.dart';
import 'package:vascomm_tes/presentation/widgets/app_form_field.dart';
import 'package:vascomm_tes/presentation/widgets/app_text.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _bloc = DIObject.loginBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Center(
            child: _BlocBuilder(bloc: _bloc),
          ),
        ),
      ]),
    );
  }
}

class _BlocBuilder extends StatelessWidget {
  final LoginBloc bloc;

  const _BlocBuilder({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (ctx, state) {
        if (state is ShowLoadingState) {}

        if (state is SuccessState) {
          _checkLoading(context);
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
          });
        }

        if (state is ShowErrorState) {
          _checkLoading(context);
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            AppUtil.showSnackBar(context, message: state.message);
          });
        }

        if (state is ShowErrorNetworkState) {
          _checkLoading(context);
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            AppUtil.showSnackBar(
              context,
              message: state.message,
              isNetworkError: true,
              onPressed: () => bloc.add(DoLoginEvent()),
            );
          });
        }

        return SingleChildScrollView(
          child: _FormView(bloc: bloc),
        );
      },
    );
  }

  void _checkLoading(BuildContext context) {
    // if (bloc.isLoading) {
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     Navigator.pop(context);
    //   });
    //   bloc.isLoading = false;
    // }
  }
}

class _FormView extends StatelessWidget {
  final LoginBloc bloc;

  const _FormView({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.space16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BannerView(),

          const SizedBox(height: 40),
          // LoginForm(bloc: bloc),
          Column(
            children: [
              AppFormField(
                title: "Email",
                isError: bloc.isUsernameEmpty,
                controller: bloc.emailCtrl,
                inputType: TextInputType.text,
                onChanged: (v) => bloc.add(ValidateLoginEvent()),
              ),
              AppFormField(
                title: "Password",
                isError: bloc.isPasswordEmpty,
                controller: bloc.pwCtrl,
                isPassword: true,
                isPasswordHidden: bloc.isPasswordHidden,
                inputType: TextInputType.visiblePassword,
                onChanged: (v) => bloc.add(ValidateLoginEvent()),
                onTapPassword: () {
                  bloc.isPasswordHidden = !bloc.isPasswordHidden;
                  bloc.add(ChangeLoginStateEvent());
                },
              ),
              AppButton(
                title: "Login",
                elevation: 0,
                onPressed: () => bloc.add(DoLoginEvent()),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),

          Container(
            width: double.infinity,
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    title: "Belum punya akun? ",
                    textStyle: AppTypography.bodyMedium(color: NeutralColor.lightGrey),
                    align: TextAlign.center,
                  ),
                  const SizedBox(width: 8,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                    child: AppText(
                      title: "Daftar sekarang",
                      textStyle: AppTypography.actionMedium(),
                      align: TextAlign.center,
                    ),
                  )

                ],
              ),
            ),
          ),
          const SizedBox(height: 40,),
          const FooterView()
        ],
      ),
    );
  }
}
