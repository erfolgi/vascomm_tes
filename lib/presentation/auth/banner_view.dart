import 'package:flutter/material.dart';
import 'package:vascomm_tes/core/config/app_typography.dart';
import 'package:vascomm_tes/core/config/asset_string.dart';
import 'package:vascomm_tes/presentation/widgets/app_text.dart';

class BannerView extends StatelessWidget {
  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                title: "Hai, ",
                textStyle: AppTypography.title(),
              ),
              AppText(
                title: "Selamat Datang",
                textStyle: AppTypography.titleBold(),
              ),
            ],
          ),
          const SizedBox(height: 4),
          AppText(
            title: "Silahkan login untuk melanjutkan",
            textStyle: AppTypography.body(),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              AssetString.imAuth,
              width: 306,
              height: 218,
              fit: BoxFit.fill,
            ),
          ),
        ]);
  }
}
