import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:salon_app/app/routes/app_pages.dart';
import 'package:salon_app/app/ui/android/Auth/sign_in.dart';
import 'package:salon_app/app/ui/theme/app_theme.dart';
import 'package:salon_app/app/ui/utils/math_utils.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    GetMaterialApp(
      navigatorKey: key,
      debugShowCheckedModeBanner: false,
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
