import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vascomm_tes/core/config/app_typography.dart';
import 'package:vascomm_tes/core/config/extension/string_validation_extension.dart';
import 'package:vascomm_tes/data/models/text_field_validation.dart';
import 'package:vascomm_tes/presentation/widgets/app_text.dart';

class AppUtil{
  static void showSnackBar(BuildContext context, {
    String? message,
    bool isError = true,
    bool isNetworkError = false,
    VoidCallback? onPressed
  }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: AppText(
        title: message,
        textStyle: AppTypography.bodyMedium(color: Colors.white) as TextStyle,
      ),
      action: isNetworkError? SnackBarAction(
        label: "Retry",
        onPressed: () => onPressed?.call(),
      ) : null,
      backgroundColor: isError ? Colors.red : Colors.black,
      behavior: SnackBarBehavior.floating,
    ));
  }


  static TextFieldValidation isTextFieldValid(String text){
    if(text.isEmpty){
      return TextFieldValidation(isValid: false, message: "tidak boleh kosong");
    }
    return TextFieldValidation(isValid: true, message: "");
  }

  static TextFieldValidation isPhoneValid(String text){
    if(text.isEmpty){
      return TextFieldValidation(isValid: false, message: "tidak boleh kosong");
    }
    if(text[0]!="0" && (text[0]!="6" || (text[1])!="6")  ){
      return TextFieldValidation(isValid: false, message: "harus lebih dari 8 karakter");
    }
    return TextFieldValidation(isValid: true, message: "");
  }

  static TextFieldValidation isPasswordValid(String pass) {
    if(pass.isEmpty){
      return TextFieldValidation(isValid: false, message: "tidak boleh kosong");
    }

    if(pass.length < 8){
      return TextFieldValidation(isValid: false, message: "harus lebih dari 8 karakter");
    }

    if(!pass.isPasswordStrong()){
      return TextFieldValidation(isValid: false, message: "tidak valid");
    }
    return TextFieldValidation(isValid: true, message: "");
  }


  static String toCurrency(int value){
    String formattedPrice = NumberFormat.currency(symbol: 'Rp').format(value / 100.0);

    return formattedPrice; // Output: $10.00
  }
}