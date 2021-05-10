import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app/app/controller/auth_controller/signin_controller.dart';
import 'package:salon_app/app/ui/theme/app_colors.dart';
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
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(getSize(30)),
            child: Center(
              child: Image.asset(
                "assets/salon_logo_2.png",
                height: getSize(150),
                width: getSize(150),
              ),
            ),
          ),
          Expanded(
            child: Container(
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
                            CommonTextfield(
                              focusNode: controller.emailFocusNode,
                              textOption: TextFieldOption(
                                prefixWid: getCommonIconWidget(
                                    imageName: "assets/auth/user.png",
                                    imageType: IconSizeType.small),
                                //Image.asset(profileEmail,),

                                hintText: "Enter Email",
                                inputController: controller.emailController,
                                errorBorder: controller.isEmailValid.value
                                    ? null
                                    : OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(11)),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.red),
                                      ),

                                formatter: [],
                              ),
                              textCallback: (text) {
                                if (controller.autoValidate.value) {
                                  if (text.isEmpty) {
                                    controller.isEmailValid.value = false;
                                  } else if (!ValidationUtils.validateEmail(
                                      text)) {
                                    controller.isEmailValid.value = false;
                                  } else {
                                    controller.isEmailValid.value = true;
                                  }
                                }
                                controller.formKey.currentState.validate();
                              },
                              validation: (text) {
                                if (text.isEmpty) {
                                  controller.isEmailValid.value = false;

                                  return "Enter Email";
                                } else if (!ValidationUtils.validateEmail(
                                    text)) {
                                  return "Enter valid email";
                                } else {
                                  return null;
                                }
                              },
                              inputAction: TextInputAction.next,
                              // onNextPress: () {
                              //   fieldFocusChange(context, _focusPassword);
                              // },
                            ),
                            SizedBox(
                              height: getSize(30),
                            ),
                            CommonTextfield(
                              focusNode: controller.passwordFocusNode,
                              textOption: TextFieldOption(
                                prefixWid: getCommonIconWidget(
                                    imageName: "assets/auth/lock.png",
                                    imageType: IconSizeType.small),
                                //Image.asset(profileEmail,),

                                hintText: "Enter Password",
                                inputController: controller.passwordController,
                                errorBorder: controller.isPasswordValid.value
                                    ? null
                                    : OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(11)),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.red),
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
                                }
                                controller.formKey.currentState.validate();
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
                            ),
                            SizedBox(
                              height: getSize(30),
                            ),
                            AppButton.flat(
                              fitWidth: true,
                              onTap: () async {
                                if (controller.formKey.currentState
                                    .validate()) {
                                  controller.loading.value = true;

                                  controller.loginCall();
                                } else {
                                  controller.autoValidate.value = true;
                                }
                              },
                              text: "Login",
                              backgroundColor: primaryColor,
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
