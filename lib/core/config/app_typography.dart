import 'package:flutter/material.dart';
import 'package:vascomm_tes/core/config/app_color.dart';

class AppTypography {

  static TextStyle  title({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.base,
      fontSize: 28,
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w400,
      fontStyle: style ?? FontStyle.normal
  );

  static TextStyle  titleBold({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.base,
      fontSize: 28,
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w700,
      fontStyle: style ?? FontStyle.normal
  );

  static TextStyle  header({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.light,
      fontSize: 14,
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w400,
      fontStyle: style ?? FontStyle.normal
  );

  static TextStyle  headerBold({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.light,
      fontSize: 14,
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w700,
      fontStyle: style ?? FontStyle.normal
  );

  static TextStyle  subtitle({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.light,
      fontSize: 12,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.w600,
      fontStyle: style ?? FontStyle.normal
  );

  static TextStyle  label({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.base,
      fontSize: 16,
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w500,
      fontStyle: style ?? FontStyle.normal
  );

  static TextStyle  body({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? NeutralColor.black,
      fontSize: 12,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.w400,
      fontStyle: style ?? FontStyle.normal
  );

  static TextStyle  bodyMedium({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? NeutralColor.black,
      fontSize: 14,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.w400,
      fontStyle: style ?? FontStyle.normal
  );



  static TextStyle  actionMedium({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.base,
      fontSize: 14,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.w600,
      fontStyle: style ?? FontStyle.normal
  );
  static TextStyle  actionLarge({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.base,
      fontSize: 14,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.w700,
      fontStyle: style ?? FontStyle.normal
  );
  static TextStyle  actionSmall({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.base,
      fontSize: 12,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.w600,
      fontStyle: style ?? FontStyle.normal
  );



  static TextStyle  gilroy20B({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.base,
      fontSize: 18,
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w700,
      fontStyle: style ?? FontStyle.normal
  );

  static TextStyle  gilroy20R({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.base,
      fontSize: 18,
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w400,
      fontStyle: style ?? FontStyle.normal
  );

  static TextStyle  gilroy18SB({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.base,
      fontSize: 18,
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w600,
      fontStyle: style ?? FontStyle.normal

  );

  static TextStyle  gilroy16SB({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.base,
      fontSize: 16,
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w600,
      fontStyle: style ?? FontStyle.normal

  );

  static TextStyle  gilroy18B({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.base,
      fontSize: 18,
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w600,
      fontStyle: style ?? FontStyle.normal
  );
  static TextStyle  gilroy14B({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.base,
      fontSize: 14,
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w600,
      fontStyle: style ?? FontStyle.normal
  );
  static TextStyle  gilroy12SB({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? NeutralColor.white,
      fontSize: 12,
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w600,
      fontStyle: style ?? FontStyle.normal
  );
  static TextStyle  proxima12R({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.light,
      fontSize: 12,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.w400,
      fontStyle: style ?? FontStyle.normal
  );
  static TextStyle  proxima14R({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.light,
      fontSize: 12,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.w400,
      fontStyle: style ?? FontStyle.normal
  );
  static TextStyle  proxima16R({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.light,
      fontSize: 16,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.w400,
      fontStyle: style ?? FontStyle.normal
  );
  static TextStyle  proxima12SB({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.light,
      fontSize: 12,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.w600,
      fontStyle: style ?? FontStyle.normal
  );
  static TextStyle  proxima10R({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? AccentColor.green,
      fontSize: 12,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.w400,
      fontStyle: style ?? FontStyle.normal
  );
  static TextStyle  proxima14SB({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.light,
      fontSize: 14,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.w600,
      fontStyle: style ?? FontStyle.normal
  );
  static TextStyle  proxima16SB({Color? color, FontStyle? style}) => TextStyle(
      color: color ?? PrimaryColor.light,
      fontSize: 16,
      fontFamily: 'ProximaNova',
      fontWeight: FontWeight.w600,
      fontStyle: style ?? FontStyle.normal
  );

}