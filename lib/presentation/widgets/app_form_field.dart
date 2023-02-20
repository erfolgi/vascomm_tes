import 'package:flutter/material.dart';
import 'package:vascomm_tes/core/config/app_color.dart';
import 'package:vascomm_tes/core/config/app_typography.dart';
import 'package:vascomm_tes/core/config/asset_string.dart';
import 'package:vascomm_tes/presentation/widgets/app_form_label.dart';
import 'package:vascomm_tes/presentation/widgets/app_text.dart';

import '../../core/config/dimens.dart';

class AppFormField extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Color? borderColor;
  final Color? bgColor;
  final String? hint;
  final bool? isEnable;
  final bool isPassword;
  final bool isPasswordHidden;
  final TextInputType? inputType;
  final bool isMultiline;
  final TextEditingController? controller;
  final Function(String v)? onChanged;
  final Function(String v)? onSubmit;
  final Function? onTapPassword;
  final String? postfix;
  final String? prefix;

  final String title;
  // final Widget child;
  final bool isError;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String? initialValue;
  final String? errorText;


  const AppFormField(
      {Key? key,
        this.height,
        this.width,
        this.borderColor,
        this.hint,
        this.isEnable = true,
        this.inputType,
        this.isMultiline = false,
        this.controller,
        this.onChanged,
        this.onSubmit,
        this.bgColor,
        this.isPassword = false,
        this.onTapPassword,
        this.isPasswordHidden = false,
        this.radius = 12,
        required this.title,
        required this.isError,
        this.margin,
        this.padding,
        this.postfix,
        this.prefix,
        this.errorText,
        this.initialValue}
      )
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: AppFormLabel(
        title: title,
        isError: isError,
        errorText: errorText,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          child: Container(
            height: height ?? 52,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
              color: bgColor ?? NeutralColor.white,
              border: Border.all(color: borderColor ?? NeutralColor.white),
              borderRadius: BorderRadius.circular(radius ?? 12),
            ),
            child: Row(
              crossAxisAlignment: isMultiline? CrossAxisAlignment.start:
              CrossAxisAlignment.center,
              children: [
                SizedBox(width:prefix!=null?Dimens.space8:0),
                prefix!=null?AppText(
                    title: prefix
                ): const SizedBox(),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    enabled: isEnable,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: hint??"Masukkan $title",
                      isCollapsed: true,
                      isDense: true,
                      hintStyle: AppTypography.body(color: NeutralColor.grey),
                      hintMaxLines: 1,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      contentPadding: isMultiline? const EdgeInsets.fromLTRB(16, 16, 16, 16)
                          : EdgeInsets.symmetric(horizontal: Dimens.space16),
                    ),
                    style: AppTypography.body(color: NeutralColor.black),
                    obscureText: isPasswordHidden,
                    keyboardType: inputType ?? TextInputType.text,
                    onChanged: onChanged,
                    onFieldSubmitted: onSubmit,
                    maxLines: isMultiline ? null : 1,
                    textInputAction:
                    isMultiline ? TextInputAction.newline : TextInputAction.done,
                    initialValue: initialValue,
                  ),
                ),
                isPassword? PasswordVisibility(
                  onTap: () => onTapPassword?.call(),
                ): const SizedBox(),

                SizedBox(width: Dimens.space8),

              ],
            ),
          ),
        )
      ),
    );
  }
}
class PasswordVisibility extends StatefulWidget {

  final Function? onTap;

  const PasswordVisibility({Key? key, this.onTap}) : super(key: key);

  @override
  State<PasswordVisibility> createState() => _PasswordVisibilityState();
}

class _PasswordVisibilityState extends State<PasswordVisibility> {

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(200),
      onTap: () {
        setState(() => isVisible = !isVisible);
        widget.onTap?.call();
      },
      child: Image.asset(
        !isVisible? AssetString.icShow: AssetString.icHide,
        height: 24,
        width: 24,
      ),
    );
  }
}
