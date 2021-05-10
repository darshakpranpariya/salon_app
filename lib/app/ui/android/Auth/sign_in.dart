import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app/app/controller/auth_controller/signin_controller.dart';
import 'package:salon_app/app/ui/theme/app_colors.dart';
import 'package:salon_app/app/ui/theme/app_text_theme.dart';
import 'package:salon_app/app/ui/utils/app_button.dart';
import 'package:salon_app/app/ui/utils/common_textfield.dart';
import 'package:salon_app/app/ui/utils/common_widgets.dart';
import 'package:salon_app/app/ui/utils/math_utils.dart';
import 'package:salon_app/app/ui/utils/validator_utils.dart';

class SignIn extends StatelessWidget {
  final controller = Get.put<SignInContoller>(SignInContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: getSize(300),
            padding: EdgeInsets.symmetric(
              vertical: getSize(70),
            ),
            color: primaryColor,
            child: Image.asset(
              "assets/salon_logo_2.png",
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: getSize(250)),
            padding: EdgeInsets.all(getSize(30)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: bgColor,
            ),
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: GetBuilder(
                    init: controller,
                    builder: (_) {
                      return Column(
                        children: [
                          getEmailTextField(),
                          SizedBox(
                            height: getSize(30),
                          ),
                          getPasswordTextField(),
                          SizedBox(
                            height: getSize(30),
                          ),
                          getLogInButton(),
                          SizedBox(
                            height: getSize(15),
                          ),
                          Text(
                            "Forgot Password ?",
                            style: black16TextStyle,
                          )
                        ],
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }

  AppButton getLogInButton() {
    return AppButton.flat(
      fitWidth: true,
      onTap: () async {
        if (controller.formKey.currentState.validate()) {
          controller.loading.value = true;

          controller.loginCall();
        } else {
          controller.autoValidate.value = true;
        }
      },
      text: "Login",
      backgroundColor: primaryColor,
    );
  }

  CommonTextfield getPasswordTextField() {
    return CommonTextfield(
      focusNode: controller.passwordFocusNode,
      textOption: TextFieldOption(
        prefixWid: getCommonIconWidget(
            imageName: "assets/auth/lock.png", imageType: IconSizeType.small),
        //Image.asset(profileEmail,),

        hintText: "Enter Password",
        inputController: controller.passwordController,
        errorBorder: controller.isPasswordValid.value
            ? null
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(11)),
                borderSide: BorderSide(width: 1, color: Colors.red),
              ),

        formatter: [],
      ),
      textCallback: (text) {
        if (controller.autoValidate.value) {
          if (text.isEmpty) {
            controller.isPasswordValid.value = false;
          } else {
            controller.isPasswordValid.value = true;
          }
          controller.formKey.currentState.validate();
        }
      },
      validation: (text) {
        if (text.isEmpty) {
          controller.isPasswordValid.value = false;

          return "Enter Password";
        } else {
          return null;
        }
      },
      inputAction: TextInputAction.next,
      // onNextPress: () {
      //   fieldFocusChange(context, _focusPassword);
      // },
    );
  }

  CommonTextfield getEmailTextField() {
    return CommonTextfield(
      focusNode: controller.emailFocusNode,
      textOption: TextFieldOption(
        prefixWid: getCommonIconWidget(
            imageName: "assets/auth/user.png", imageType: IconSizeType.small),
        //Image.asset(profileEmail,),

        hintText: "Enter Email",
        inputController: controller.emailController,
        errorBorder: controller.isEmailValid.value
            ? null
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(11)),
                borderSide: BorderSide(width: 1, color: Colors.red),
              ),

        formatter: [],
      ),
      textCallback: (text) {
        if (controller.autoValidate.value) {
          if (text.isEmpty) {
            controller.isEmailValid.value = false;
          } else if (!ValidationUtils.validateEmail(text)) {
            controller.isEmailValid.value = false;
          } else {
            controller.isEmailValid.value = true;
          }
          controller.formKey.currentState.validate();
        }
      },
      validation: (text) {
        if (text.isEmpty) {
          controller.isEmailValid.value = false;

          return "Enter Email";
        } else if (!ValidationUtils.validateEmail(text)) {
          return "Enter valid email";
        } else {
          return null;
        }
      },
      inputAction: TextInputAction.next,
      // onNextPress: () {
      //   fieldFocusChange(context, _focusPassword);
      // },
    );
  }
}
