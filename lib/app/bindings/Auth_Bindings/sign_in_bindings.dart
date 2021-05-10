import 'package:get/get.dart';
import 'package:salon_app/app/controller/auth_controller/signin_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignInContoller>(SignInContoller());
  }
}
