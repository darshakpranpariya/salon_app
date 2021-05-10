import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app/app/routes/app_pages.dart';
import 'package:salon_app/app/ui/android/Auth/sign_in.dart';
import 'package:salon_app/app/ui/theme/app_theme.dart';
import 'package:salon_app/app/ui/utils/math_utils.dart';

void main() {
  runApp(
    GetMaterialApp(
      navigatorKey: key,
      debugShowCheckedModeBanner: false,
      // initialBinding: HomeBinding(),
      initialRoute: Routes.INITIAL,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      home: SignIn(),
      // locale: Locale('pt', 'BR'),
      // translationsKeys: AppTranslation.translations,
    ),
  );
}
