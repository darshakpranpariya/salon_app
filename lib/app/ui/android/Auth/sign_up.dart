import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:salon_app/app/controller/auth_controller/singup_controller.dart';
import 'package:salon_app/app/routes/app_pages.dart';
import 'package:salon_app/app/translations/string_constant/constants.dart';
import 'package:salon_app/app/ui/constants/image_constants.dart';
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
            color: ColorConstants.primaryColor,
            child: Image.asset(
              logo,
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
              color: ColorConstants.bgColor,
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
                              SIGNUP.tr,
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
                              text: YouDontHaveAnAccount.tr,
                              style: black16TextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed(Routes.SIGNIN);
                                    },
                                  text: SIGNIN.tr,
                                  style: black16TextStyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: ColorConstants.primaryColor,
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
              primary: ColorConstants.primaryColor,
              onPrimary: Colors.white,
              surface: ColorConstants.primaryColor,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: ColorConstants.bgColor,
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
      text: SIGNUP.tr,
      backgroundColor: ColorConstants.primaryColor,
    );
  }

  CommonTextfield getPasswordTextField() {
    return CommonTextfield(
      focusNode: controller.passwordFocusNode,
      textOption: TextFieldOption(
        isSecureTextField: true,
        prefixWid:
            getCommonIconWidget(imageName: lock, imageType: IconSizeType.small),
        //Image.asset(profileEmail,),

        hintText: EnterPassword.tr,
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

          return EnterPassword.tr;
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
        prefixWid:
            getCommonIconWidget(imageName: mail, imageType: IconSizeType.small),
        //Image.asset(profileEmail,),

        hintText: EnterEmail.tr,
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

          return EnterEmail.tr;
        } else if (!ValidationUtils.validateEmail(text)) {
          return EnterValidEmail.tr;
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
            imageName: userIcon, imageType: IconSizeType.small),
        //Image.asset(profileEmail,),

        hintText: EnterUserName.tr,
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

          return EnterUserName.tr;
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
            imageName: calender,
            imageType: IconSizeType.small,
          ),
          //Image.asset(profileEmail,),

          hintText: EnterDateOfBirth.tr,
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

            return EnterDateOfBirth.tr;
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
            imageName: address, imageType: IconSizeType.small),
        //Image.asset(profileEmail,),

        hintText: EnterAddress.tr,
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

          return EnterAddress.tr;
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
