import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app/app/ui/android/home/home_page.dart';
import 'package:salon_app/app/ui/android/home/notify/notify.dart';

class SignInContoller extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  RxBool isEmailValid = true.obs;
  RxBool isPasswordValid = true.obs;
  RxBool autoValidate = false.obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    // fetchApi();
    emailController.text = "dp@gmail.com";
    passwordController.text = "1234567";
    super.onInit();
  }

  loginCall() {
    print(emailController.text);
    print(passwordController.text);

    Get.to(HomePage());
  }
}
