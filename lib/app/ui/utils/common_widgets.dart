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

enum IconSizeType { small, medium, large }

getCommonIconWidget(
    {String imageName,
    IconSizeType imageType = IconSizeType.medium,
    Color color = Colors.black,
    VoidCallback onTap,
    GlobalKey search_key}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: getSize(46),
      height: getSize(46),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(getImageSize(imageType)),
          width: getSize(46),
          height: getSize(46),
          child: Image.asset(
            imageName,
            key: search_key,
            color: color,
          ),
        ),
      ),
    ),
  );
}

double getImageSize(IconSizeType imaegType) {
  if (imaegType == IconSizeType.small) {
    return getSize(12);
  } else if (imaegType == IconSizeType.medium) {
    return getSize(14);
  } else if (imaegType == IconSizeType.large) {
    return getSize(4);
  }
}
