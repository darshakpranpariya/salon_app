import 'package:get/get.dart';
import 'package:salon_app/app/ui/android/Auth/sign_in.dart';
import 'package:salon_app/app/ui/android/Auth/sign_up.dart';
import 'package:salon_app/app/ui/android/home/home_page.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => MyApp(),
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => SignIn(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUp(),
    ),
  ];
}
