import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salon_app/app/data/model/user_model.dart';
import 'package:salon_app/app/ui/utils/dialogs.dart';

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
  final signUpBox = GetStorage();

  signUpCall() {
    print(emailController.text);
    print(passwordController.text);
    UserModel user = UserModel();
    user.userName = nameController.text;
    user.emailId = emailController.text;
    user.password = passwordController.text;
    user.dob = dobController.text;
    user.address = addressController.text;
    signUpBox.write("userData", user.toJson()).then((value) {
      Future.delayed(Duration(milliseconds: 500), () {
        showToast(msg: "Sign Up Successfully done!!");
      });
      Get.back();
    });
  }
}
