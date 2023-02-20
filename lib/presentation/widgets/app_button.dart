import 'package:flutter/material.dart';
import 'package:vascomm_tes/core/config/app_color.dart';
import 'package:vascomm_tes/core/config/app_typography.dart';
import 'package:vascomm_tes/core/config/asset_string.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final Function? onPressed;
  final double? height;
  final double? width;
  final Color? color;
  final Widget? child;
  final bool isEnable;
  final double? radius;
  final String? title;
  final String? drawableEnd;
  final double? elevation;
  final TextStyle? textStyle;

  const AppButton(
      {Key? key,
      this.onPressed,
      this.height,
      this.width,
      this.color,
      this.child,
      this.isEnable = true,
      this.radius = 12,
      this.title,
      this.elevation,
        this.drawableEnd,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (isEnable) onPressed?.call();
      },
      height: height ?? 52,
      minWidth: width ?? double.infinity,
      color: isEnable ? color ?? PrimaryColor.base : NeutralColor.grey,
      elevation: elevation ?? 0.0,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
      child: title != null
          ? Stack(
              children: [
                Container(
                  width: double.infinity,
                    child: AppText(
                  title: title,
                  textStyle: textStyle ??
                      AppTypography.label(
                        color: isEnable ? Colors.white : NeutralColor.darkGrey,
                      ),
                  align: TextAlign.center,
                )),
                Positioned(
                  right: 0,
                  child: Image.asset(
                    drawableEnd ??AssetString.icArrowRight,
                    width: 24,
                    height: 24,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            )
          : child,
    );
  }
}
