import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app/app/routes/app_pages.dart';
import 'package:salon_app/app/ui/android/home/home_page.dart';
import 'package:salon_app/app/ui/theme/app_theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialBinding: HomeBinding(),
      initialRoute: Routes.INITIAL,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      home: MyApp(),
      // locale: Locale('pt', 'BR'),
      // translationsKeys: AppTranslation.translations,
    ),
  );
}
