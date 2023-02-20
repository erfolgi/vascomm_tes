import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vascomm_tes/core/config/app_color.dart';
import 'package:vascomm_tes/core/config/app_typography.dart';
import 'package:vascomm_tes/core/config/asset_string.dart';
import 'package:vascomm_tes/core/config/const.dart';
import 'package:vascomm_tes/di/di_object.dart';
import 'package:vascomm_tes/presentation/blocs/profile/profile_setting_bloc.dart';
import 'package:vascomm_tes/presentation/dashboard/drawer_view.dart';
import 'package:vascomm_tes/presentation/widgets/app_button.dart';
import 'package:vascomm_tes/presentation/widgets/app_form_field.dart';
import 'package:vascomm_tes/presentation/widgets/app_text.dart';

class ProfileSettingScreen extends StatefulWidget {
  static const routeName = "/profile_setting";

  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  final _bloc = DIObject.profileSettingBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        if (state is InitState) {}
        return Scaffold(
            appBar: AppBar(
                elevation: 0,
                iconTheme: IconThemeData(color: PrimaryColor.base),
                backgroundColor: NeutralColor.white,
                actions: [
                  InkWell(
                    child: Image.asset(
                      AssetString.icCart,
                      height: 22,
                      width: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: InkWell(
                          child: Image.asset(
                            AssetString.icNotif,
                            height: 22,
                            width: 22,
                          ),
                        ),
                      ),
                      Positioned(
                        top:15,
                        right: 1,
                        child: Icon(Icons.circle,
                            color: AccentColor.red, size: 9),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ]),
            drawerScrimColor: PrimaryColor.base.withOpacity(0.8),
            drawer: DrawerView(),
            body: SingleChildScrollView(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // use whichever suits your need
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            padding: const EdgeInsets.all(0),
                            elevation: 0,
                            color: AccentColor.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(99)),
                            child: AppText(
                                title: "Profile Saya",
                                textStyle: AppTypography.gilroy12SB(
                                    color: PrimaryColor.base)),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            padding: const EdgeInsets.all(0),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(99)),
                            color: NeutralColor.white,
                            child: AppText(
                                title: "Pengaturan",
                                textStyle: AppTypography.gilroy12SB(
                                    color: PrimaryColor.base)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              AssetString.bgProfile,
                              width: Const.mediaHeight(context),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 36),
                              child: Row(children: [
                                CircleAvatar(
                                    radius: 20,
                                    backgroundColor: NeutralColor.lightGrey,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(99.0),
                                      child: Image.asset(
                                          AssetString.samplePhoto,
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.cover),
                                    )),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          title: "Angga",
                                          textStyle: AppTypography.gilroy20B(
                                              color: NeutralColor.white),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        AppText(
                                          title: "Praja",
                                          textStyle: AppTypography.gilroy20R(
                                              color: NeutralColor.white),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    AppText(
                                      title: "Membership BBLK",
                                      textStyle: AppTypography.proxima14SB(
                                          color: NeutralColor.lightGrey),
                                    )
                                  ],
                                )
                              ]),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: Const.mediaWidth(context),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 11),
                                decoration: BoxDecoration(
                                  color: PrimaryColor.lighter,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: AppText(
                                  title:
                                      "Lengkapi profile anda untuk memaksimalkan\npenggunaan aplikasi",
                                  textStyle: AppTypography.proxima14R(
                                      color: NeutralColor.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppText(
                          title: "Pilih data yang ingin ditampilkan",
                          textStyle: AppTypography.gilroy16SB(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                AppFormField(
                                  title: "Nama Depan",
                                  isError: !_bloc.isFirstNameValid.isValid,
                                  controller: _bloc.firstNameCtrl,
                                  inputType: TextInputType.text,
                                  isMultiline: false,
                                  
                                ),
                                AppFormField(
                                  title: "Nama Belakang",
                                  isError: !_bloc.isLastNameValid.isValid,
                                  controller: _bloc.lastNameCtrl,
                                  inputType: TextInputType.text,
                                  isMultiline: false,
                                  
                                ),
                                AppFormField(
                                  title: "No. KTP",
                                  isError: !_bloc.isKtpValid.isValid,
                                  controller: _bloc.ktpCtrl,
                                  inputType: TextInputType.number,
                                  isMultiline: false,
                                  
                                ),
                                AppFormField(
                                  title: "No. Telpon",
                                  isError: !_bloc.isPhoneValid.isValid,
                                  controller: _bloc.phoneCtrl,
                                  inputType: TextInputType.phone,
                                  isMultiline: false,
                                  
                                ),
                                AppFormField(
                                  title: "Email",
                                  isError: !_bloc.isEmailValid.isValid,
                                  controller: _bloc.emailCtrl,
                                  inputType: TextInputType.emailAddress,
                                  isMultiline: false,
                                  
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      AssetString.icInfo,
                                      width: 16,
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Wrap(children: [
                                      AppText(
                                        title:
                                            "Pastikan profile anda terisi dengan benar,\ndata pribadi anda terjamin keamanannya",
                                        textStyle: AppTypography.proxima12R(),
                                      ),
                                    ])
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                AppButton(
                                  child: AppButton(
                                    title: "Simpan Profile",
                                    drawableEnd: AssetString.icSave,
                                    elevation: 0,
                                    onPressed: () => _bloc.add(ValidateEvent()),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 77,
              ),
              Stack(
                children: [
                  Image.asset(
                    AssetString.bgFooter,
                    height: 110,
                    width: Const.mediaWidth(context),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 16),
                    child: Row(
                      children: [
                        AppText(
                          title: "Ingin mendapat update\ndari kami ?",
                          textStyle:
                              AppTypography.gilroy16SB(color: Colors.white),
                        ),
                        const Spacer(),
                        AppText(
                          title: "Dapatkan\nnotifikasi",
                          align: TextAlign.end,
                          textStyle:
                              AppTypography.proxima14R(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Image.asset(
                          AssetString.icArrowRight,
                          width: 16,
                          height: 16,
                        )
                      ],
                    ),
                  )
                ],
              )
            ])));
      },
    );
  }
}
