import 'package:flutter/material.dart';

import '../../core/config/app_color.dart';
import '../../core/config/app_typography.dart';
import 'app_text.dart';

class AppFormLabel extends StatelessWidget {

  final String title;
  final String? errorText;
  final Widget child;
  final bool isError;


  const AppFormLabel({
    Key? key,
    required this.title,
    required this.child,
    required this.isError,
    this.errorText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: title,
          textStyle: AppTypography.label(),
        ),
        const SizedBox(height: 8),
        child,
        Visibility(
          visible: isError,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.error, color: AccentColor.red, size: 16),
                  const SizedBox(width: 4),
                  AppText(
                    title: errorText==null?"tidak boleh kosong":errorText.toString(),
                    textStyle: AppTypography.body(
                      color: AccentColor.red,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}