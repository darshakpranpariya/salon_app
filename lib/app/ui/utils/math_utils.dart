import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

dynamic getSize(double px) {
  return px *
      ((MathUtilities.screenWidth(key.currentState.overlay.context)) / 414);
}

dynamic getFontSize(double px) {
  return px *
      (MathUtilities.screenWidth(key.currentState.overlay.context) / 414);
}

dynamic getPercentageWidth(double percentage) {
  return MathUtilities.screenWidth(key.currentState.overlay.context) *
      percentage /
      100;
}

class MathUtilities {
  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static safeAreaTopHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static safeAreaBottomHeight(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}
