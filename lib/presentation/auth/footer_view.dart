import 'package:flutter/material.dart';
import 'package:vascomm_tes/core/config/app_color.dart';
import 'package:vascomm_tes/core/config/app_typography.dart';
import 'package:vascomm_tes/core/config/asset_string.dart';
import 'package:vascomm_tes/presentation/widgets/app_text.dart';

class FooterView extends StatelessWidget {
  const FooterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AssetString.icCredit,
          width: 16,
          height: 16,
        ),
        SizedBox(width: 8,),
        AppText(
          title: "SILK. all right reserved",
          textStyle: AppTypography.actionSmall(color: NeutralColor.lightGrey),
        )
      ],
    );
  }
}
