import 'package:flutter/material.dart';
import 'package:salon_app/app/ui/theme/app_text_theme.dart';
import 'package:salon_app/app/ui/utils/math_utils.dart';

getTitleText(
  BuildContext context,
  String text, {
  Color color,
  double fontSize,
  TextAlign alignment = TextAlign.left,
  FontWeight fontweight,
}) {
  return Text(
    text,
    style: commonTextStyle.copyWith(
      color: color,
      fontFamily: 'CerebriSans',
      fontSize: fontSize == null ? getSize(16) : fontSize,
      fontWeight: fontweight == null ? FontWeight.w600 : fontweight,
    ),
    textAlign: alignment,
  );
}
