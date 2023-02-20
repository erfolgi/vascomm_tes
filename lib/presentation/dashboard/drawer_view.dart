import 'package:flutter/material.dart';
import 'package:vascomm_tes/core/config/app_color.dart';
import 'package:vascomm_tes/core/config/app_typography.dart';
import 'package:vascomm_tes/core/config/asset_string.dart';
import 'package:vascomm_tes/core/config/const.dart';
import 'package:vascomm_tes/core/util/app_preference.dart';
import 'package:vascomm_tes/presentation/auth/login/login_screen.dart';
import 'package:vascomm_tes/presentation/profile/profile_setting_screen.dart';
import 'package:vascomm_tes/presentation/widgets/app_text.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor:
        Colors.white, // Sets the background color of the Drawer
      ),
      child: SizedBox(
        width: Const.mediaWidth(context),
        child: Row(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding:
              const EdgeInsets.only(left: 18, right: 11, top: 40),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  AssetString.icClose,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            Expanded(
              child: Drawer(
                width: Const.mediaWidth(context),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(children: [
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
                                    textStyle: AppTypography.headerBold(),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  AppText(
                                    title: "Praja",
                                    textStyle: AppTypography.header(),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              AppText(
                                title: "Membership BBLK",
                                textStyle: AppTypography.actionSmall(
                                    color: PrimaryColor.base),
                              )
                            ],
                          )
                        ]),
                        const SizedBox(
                          height: 32,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                            Navigator.pushNamed(context, ProfileSettingScreen.routeName);
                          },
                          child: Row(
                            children: [
                              AppText(
                                title: "Profil Saya",
                                textStyle: AppTypography.actionSmall(),
                              ),
                              const Spacer(),
                              Image.asset(
                                AssetString.icChevronRight,
                                height: 20,
                                width: 20,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          child: Row(
                            children: [
                              AppText(
                                title: "Pengaturan",
                                textStyle: AppTypography.actionSmall(),
                              ),
                              const Spacer(),
                              Image.asset(
                                AssetString.icChevronRight,
                                height: 20,
                                width: 20,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            AppPreference.logoutSession();
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.routeName);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AccentColor.red,
                                borderRadius:
                                const BorderRadiusDirectional.all(
                                    Radius.circular(23))),
                            padding: const EdgeInsets.all(8),
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: AppText(
                              title: "Logout",
                              textStyle: AppTypography.actionSmall(
                                  color: NeutralColor.white),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              title: "Ikuti Kami di",
                              textStyle: AppTypography.header(
                                  color: PrimaryColor.base),
                            ),
                            const SizedBox(width: 12,),
                            InkWell(
                              child: Image.asset(AssetString.icFacebook, height: 14, width: 14,),
                            ),
                            const SizedBox(width: 8,),
                            InkWell(
                              child: Image.asset(AssetString.icInstagram, height: 14, width: 14,),
                            ),
                            const SizedBox(width: 8,),
                            InkWell(
                              child: Image.asset(AssetString.icTwitter, height: 14, width: 14,),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              child: AppText(
                                title: "FAQ",
                                textStyle: AppTypography.actionLarge(
                                    color: NeutralColor.lightGrey),
                              ),
                            ),
                            InkWell(
                              child: AppText(
                                title: "Terms and Condition",
                                textStyle: AppTypography.actionLarge(
                                    color: NeutralColor.lightGrey),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
