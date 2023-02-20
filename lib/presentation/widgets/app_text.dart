import 'package:flutter/material.dart';
import 'package:vascomm_tes/core/config/app_typography.dart';


class AppText extends StatelessWidget {
  final String? title;
  final TextAlign? align;
  final TextOverflow? overflow;
  final int? maxLine;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const AppText(
      {Key? key,
        this.title,
        this.align,
        this.overflow,
        this.maxLine,
        this.textStyle,
        this.margin,
        this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child:
        Text(
            title!,
            style: textStyle ?? AppTypography.bodyMedium() as TextStyle,
            maxLines: maxLine,
            overflow: overflow ?? TextOverflow.fade,
            textAlign: align,

        )
    );
  }
}
