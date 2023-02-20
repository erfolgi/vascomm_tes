import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vascomm_tes/core/config/app_color.dart';
import 'package:vascomm_tes/core/config/app_typography.dart';
import 'package:vascomm_tes/core/config/const.dart';
import 'package:vascomm_tes/core/config/dimens.dart';
import 'package:vascomm_tes/di/di_object.dart';
import 'package:vascomm_tes/presentation/auth/banner_view.dart';
import 'package:vascomm_tes/presentation/auth/footer_view.dart';

import 'package:vascomm_tes/presentation/blocs/auth/register/register_bloc.dart';
import 'package:vascomm_tes/presentation/widgets/app_button.dart';
import 'package:vascomm_tes/presentation/widgets/app_form_field.dart';
import 'package:vascomm_tes/presentation/widgets/app_text.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/register";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _bloc = DIObject.registerBloc;

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
  final RegisterBloc bloc;

  const _BlocBuilder({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (ctx, state) {


        if (state is SuccessSubmitState) {
          _checkLoading(context);
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            //Navigator.pushReplacement(context, DashboardScreen.routeName);
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
  final RegisterBloc bloc;

  const _FormView({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          const BannerView(),

          const SizedBox(height: 40),

          Column(
            children: [
              Row(
                children: [
                  AppFormField(
                    title: "Nama Depan",
                    width: (Const.mediaWidth(context)/2)-28 ,
                    isError: !bloc.isFirstNameValid.isValid,
                    controller: bloc.firstNameCtrl,
                    inputType: TextInputType.text,
                    isMultiline: false,
                  ),

                  AppFormField(
                    title: "Nama Belakang",
                    width: (Const.mediaWidth(context)/2)-28 ,
                    isError: !bloc.isLastNameValid.isValid,
                    controller: bloc.lastNameCtrl,
                    inputType: TextInputType.text,
                    isMultiline: false,
                  ),
                ],
              ),
              AppFormField(
                title: "No. KTP",
                isError: !bloc.isKtpValid.isValid,
                controller: bloc.ktpCtrl,
                inputType: TextInputType.number,
                isMultiline: false,
              ),
              AppFormField(
                title: "Email",
                isError: !bloc.isEmailValid.isValid,
                controller: bloc.emailCtrl,
                inputType: TextInputType.emailAddress,
                isMultiline: false,
              ),
              AppFormField(
                title: "No. Telpon",
                isError: !bloc.isPhoneValid.isValid,
                controller: bloc.phoneCtrl,
                inputType: TextInputType.phone,
                isMultiline: false,
              ),

              AppFormField(
                title: "Password",
                isError: !bloc.isPasswordValid.isValid,
                controller: bloc.passwordCtrl,
                isPassword: true,
                isPasswordHidden: bloc.isPasswordHidden,
                inputType: TextInputType.visiblePassword,
                onChanged: (v) => bloc.add(ValidateEvent()),
                onTapPassword: () {
                  bloc.isPasswordHidden = !bloc.isPasswordHidden;
                  bloc.add(ChangeStateEvent());
                },
              ),
              AppFormField(
                title: "Konfirmasi Password",
                isError: !bloc.isConfPasswordValid.isValid,
                controller: bloc.confPasswordCtrl,
                isPassword: true,
                isPasswordHidden: bloc.isConfPasswordHidden,
                inputType: TextInputType.visiblePassword,
                onChanged: (v) => bloc.add(ValidateEvent()),
                onTapPassword: () {
                  bloc.isConfPasswordHidden = !bloc.isConfPasswordHidden;
                  bloc.add(ChangeStateEvent());
                },
              ),
              AppButton(
                title: "Register",
                elevation: 0,
                onPressed: () => bloc.add(ValidateEvent()),
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
                    title: "Sudah punya akun? ",
                    textStyle: AppTypography.bodyMedium(color: NeutralColor.lightGrey),
                    align: TextAlign.center,
                  ),
                  const SizedBox(width: 8,),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: AppText(
                      title: "Login sekarang",
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
