import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode dobFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  RxBool isEmailValid = true.obs;
  RxBool isPasswordValid = true.obs;
  RxBool isNameValid = true.obs;
  RxBool isDobValid = true.obs;
  RxBool isAddressValid = true.obs;
  RxBool autoValidate = false.obs;
  RxBool loading = false.obs;

  signUpCall() {
    print(emailController.text);
    print(passwordController.text);
  }
}
