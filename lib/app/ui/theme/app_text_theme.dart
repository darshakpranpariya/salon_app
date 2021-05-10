import 'package:flutter/material.dart';
import 'package:salon_app/app/ui/theme/app_colors.dart';
import 'package:salon_app/app/ui/utils/math_utils.dart';

final TextStyle commonTextStyle = TextStyle(
  color: blackColor,
  fontSize: getSize(16),
  fontWeight: FontWeight.bold,
);

final grey16HintTextStyle = TextStyle(
  fontSize: getFontSize(16),
  color: textGreyColor,
  fontWeight: FontWeight.w500,
);

final error16TextStyle = TextStyle(
  fontSize: getFontSize(14),
  color: redColor,
  fontWeight: FontWeight.normal,
);

final black16TextStyle = TextStyle(
  fontSize: getFontSize(16),
  color: textColor,
  fontWeight: FontWeight.normal,
);

final black18TitleTextStyle = TextStyle(
  fontSize: getFontSize(18),
  color: textColor,
  fontWeight: FontWeight.w700,
);
