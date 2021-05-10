import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:salon_app/app/controller/auth_controller/singup_controller.dart';
import 'package:salon_app/app/routes/app_pages.dart';
import 'package:salon_app/app/ui/theme/app_colors.dart';
import 'package:salon_app/app/ui/theme/app_text_theme.dart';
import 'package:salon_app/app/ui/utils/app_button.dart';
import 'package:salon_app/app/ui/utils/common_textfield.dart';
import 'package:salon_app/app/ui/utils/common_widgets.dart';
import 'package:salon_app/app/ui/utils/date_utils.dart';
import 'package:salon_app/app/ui/utils/math_utils.dart';
import 'package:salon_app/app/ui/utils/validator_utils.dart';

class SignUp extends StatelessWidget {
  final controller = Get.put<SignUpController>(SignUpController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

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
              key: formKey,
              child: SingleChildScrollView(
                child: GetBuilder(
                    init: controller,
                    builder: (_) {
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "SignUp",
                              style: black18TitleTextStyle,
                            ),
                          ),
                          SizedBox(
                            height: getSize(30),
                          ),
                          getNameTextField(),
                          SizedBox(
                            height: getSize(20),
                          ),
                          getEmailTextField(),
                          SizedBox(
                            height: getSize(20),
                          ),
                          getPasswordTextField(),
                          SizedBox(
                            height: getSize(20),
                          ),
                          getDobTextField(context),
                          SizedBox(
                            height: getSize(20),
                          ),
                          getAddressTextField(),
                          SizedBox(
                            height: getSize(20),
                          ),
                          getLogInButton(),
                          SizedBox(
                            height: getSize(20),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "you dont't have an account! ",
                              style: black16TextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed(Routes.SIGNIN);
                                    },
                                  text: "Sign In",
                                  style: black16TextStyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
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

  Future<void> _selectDate(context) async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().day),
      lastDate: DateTime(3000),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: primaryColor,
              onPrimary: Colors.white,
              surface: primaryColor,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: bgColor,
          ),
          child: child,
        );
      },
    );
    if (selectedDate != null) {
      String date = formatDate(
        selectedDate,
        [dd, ' ', M, ' ', yyyy],
      );
      controller.dobController.text = date;
    }
  }

  AppButton getLogInButton() {
    return AppButton.flat(
      fitWidth: true,
      onTap: () async {
        if (formKey.currentState.validate()) {
          controller.loading.value = true;

          controller.signUpCall();
        } else {
          controller.autoValidate.value = true;
        }
      },
      text: "SignUp",
      backgroundColor: primaryColor,
    );
  }

  CommonTextfield getPasswordTextField() {
    return CommonTextfield(
      focusNode: controller.passwordFocusNode,
      textOption: TextFieldOption(
        isSecureTextField: true,
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
          formKey.currentState.validate();
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
      onNextPress: () {
        controller.dobFocusNode.requestFocus();
      },
    );
  }

  CommonTextfield getEmailTextField() {
    return CommonTextfield(
      focusNode: controller.emailFocusNode,
      textOption: TextFieldOption(
        prefixWid: getCommonIconWidget(
            imageName: "assets/auth/mail.png", imageType: IconSizeType.small),
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
          formKey.currentState.validate();
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
      onNextPress: () {
        controller.passwordFocusNode.requestFocus();
      },
    );
  }

  CommonTextfield getNameTextField() {
    return CommonTextfield(
      focusNode: controller.nameFocusNode,
      textOption: TextFieldOption(
        prefixWid: getCommonIconWidget(
            imageName: "assets/auth/user.png", imageType: IconSizeType.small),
        //Image.asset(profileEmail,),

        hintText: "Enter Username",
        inputController: controller.nameController,
        errorBorder: controller.isNameValid.value
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
            controller.isNameValid.value = false;
          } else {
            controller.isNameValid.value = true;
          }
          formKey.currentState.validate();
        }
      },
      validation: (text) {
        if (text.isEmpty) {
          controller.isNameValid.value = false;

          return "Enter Username";
        } else {
          return null;
        }
      },
      inputAction: TextInputAction.next,
      onNextPress: () {
        controller.emailFocusNode.requestFocus();
      },
    );
  }

  getDobTextField(context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: CommonTextfield(
        enable: false,
        focusNode: controller.dobFocusNode,
        textOption: TextFieldOption(
          prefixWid: getCommonIconWidget(
            imageName: "assets/Common/calendar.png",
            imageType: IconSizeType.small,
          ),
          //Image.asset(profileEmail,),

          hintText: "Enter date of birth",
          inputController: controller.dobController,
          errorBorder: controller.isDobValid.value
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
              controller.isDobValid.value = false;
            } else {
              controller.isDobValid.value = true;
            }
            formKey.currentState.validate();
          }
        },
        validation: (text) {
          if (text.isEmpty) {
            controller.isDobValid.value = false;

            return "Enter date of birth";
          } else {
            return null;
          }
        },
        inputAction: TextInputAction.next,
        onNextPress: () {
          controller.addressFocusNode.requestFocus();
        },
      ),
    );
  }

  CommonTextfield getAddressTextField() {
    return CommonTextfield(
      focusNode: controller.addressFocusNode,
      textOption: TextFieldOption(
        prefixWid: getCommonIconWidget(
            imageName: "assets/Common/city.png", imageType: IconSizeType.small),
        //Image.asset(profileEmail,),

        hintText: "Enter Address",
        inputController: controller.addressController,
        errorBorder: controller.isAddressValid.value
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
            controller.isAddressValid.value = false;
          } else {
            controller.isAddressValid.value = true;
          }
          formKey.currentState.validate();
        }
      },
      validation: (text) {
        if (text.isEmpty) {
          controller.isAddressValid.value = false;

          return "Enter your address";
        } else {
          return null;
        }
      },
      inputAction: TextInputAction.done,
      onNextPress: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
    );
  }
}