import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app/app/ui/constants/image_constants.dart';
import 'package:salon_app/app/ui/theme/app_colors.dart';
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

getBackButton(
    {bool isWhite = false, double height, double width, VoidCallback ontap}) {
  return IconButton(
    padding: EdgeInsets.all(3),
    onPressed: ontap ??
        () {
          Get.back();
        },
    icon: Image.asset(
      back,
      color: isWhite ? whiteColor : blackColor,
      width: width ?? getSize(22),
      height: height ?? getSize(22),
    ),
  );
  /* return Container(
    child: InkWell(
      onTap: ontap ??
          () {
            Navigator.of(context).pop();
          },
      child: Padding(
        padding: EdgeInsets.all(getSize(8.0)),
        child: Image.asset(
          back,
          color: isWhite ? appTheme.whiteColor : appTheme.textBlackColor,
          width: width ?? getSize(16),
          height: height ?? getSize(16),
        ),
      ),
    ),
  );*/
}
