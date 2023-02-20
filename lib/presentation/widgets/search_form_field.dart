import 'package:flutter/material.dart';
import 'package:vascomm_tes/core/config/app_color.dart';
import 'package:vascomm_tes/core/config/app_typography.dart';
import 'package:vascomm_tes/core/config/asset_string.dart';
import 'package:vascomm_tes/core/config/const.dart';
import 'package:vascomm_tes/core/config/dimens.dart';

class SearchFormField extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? borderColor;
  final String? hint;
  final bool? isEnable;
  final TextInputType? inputType;
  final bool isMultiline;
  final bool autofocus;
  final TextEditingController? controller;
  final EdgeInsets? margin;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;

  const SearchFormField({
    Key? key,
    this.height,
    this.width,
    this.borderColor,
    this.hint,
    this.isEnable = true,
    this.inputType,
    this.isMultiline = false,
    this.autofocus = false,
    this.controller,
    this.onChanged,
    this.onSubmit,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: NeutralColor.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99)),
      child: Container(
        height: height ?? 52,
        width: width ?? Const.mediaWidth(context),
        margin: margin,

        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                autofocus: autofocus,
                controller: controller,
                enabled: isEnable,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: hint??"Search",
                  hintStyle: AppTypography.proxima16R(color: NeutralColor.lightGrey),
                  isCollapsed: true,
                  isDense: true,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: Dimens.space16),
                ),
                style: AppTypography.bodyMedium(color: NeutralColor.black),
                keyboardType: inputType ?? TextInputType.text,
                onChanged: onChanged,
                onFieldSubmitted: onSubmit,
                maxLines: isMultiline ? null : 1,
                textInputAction:
                isMultiline ? TextInputAction.newline : TextInputAction.search,
              ),
            ),
            Image.asset(
              AssetString.icSearch,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 16,)
          ],
        ),
      ),
    );
  }
}