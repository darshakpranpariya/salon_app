import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInContoller extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  RxBool isEmailValid = true.obs;
  RxBool isPasswordValid = true.obs;
  RxBool autoValidate = false.obs;
  RxBool loading = false.obs;

  loginCall() {
    print(emailController.text);
    print(passwordController.text);
  }
}
