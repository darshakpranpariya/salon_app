import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salon_app/app/ui/android/home/home_page.dart';
import 'package:salon_app/app/data/model/user_model.dart';
import 'package:salon_app/app/ui/utils/dialogs.dart';

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
  final box = GetStorage();

  @override
  void onInit() {
    // fetchApi();
    emailController.text = "dp@gmail.com";
    passwordController.text = "1234567";
    super.onInit();
  }

  loginCall(response) {
    print(emailController.text);
    print(passwordController.text);

    try {
      var jsonData = box.read("userData");
      UserModel user = UserModel.fromJson(jsonData);

      print(user);
      if (emailController.text.compareTo(user.emailId) == 0 &&
          passwordController.text.compareTo(user.password) == 0) {
        response(true);
      } else {
        response(false);
      }
    } catch (e) {
      showToast(msg: "Have you sign up first???");
    }
  }
}
