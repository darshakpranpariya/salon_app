import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app/app/ui/android/Auth/sign_in.dart';
import 'package:salon_app/app/ui/constants/image_constants.dart';
import 'package:salon_app/app/ui/theme/app_colors.dart';
import 'package:salon_app/app/ui/theme/app_text_theme.dart';
import 'package:salon_app/app/ui/utils/common_widgets.dart';
import 'package:salon_app/app/ui/utils/dialogs.dart';
import 'package:salon_app/app/ui/utils/math_utils.dart';
import 'package:salon_app/app/controller/home_controller/profile/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.put<ProfileController>(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.bgColor,
      body: Padding(
        padding: EdgeInsets.all(getSize(30)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getSize(20),
              ),
              getProfileImage(context),
              SizedBox(
                height: getSize(15),
              ),
              Text(
                controller.user.userName,
                style: black18TitleTextStyle,
              ),
              SizedBox(
                height: getSize(15),
              ),
              Text(
                controller.user.emailId,
                style: gery16TextStyle,
              ),
              SizedBox(
                height: getSize(15),
              ),
              getFirstContainer(),
              SizedBox(
                height: getSize(20),
              ),
              getSecondContainer(),
              SizedBox(
                height: getSize(20),
              ),
              getLogoutContainer()
            ],
          ),
        ),
      ),
    );
  }

  Center getProfileImage(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (controller) {
              return Container(
                height: getSize(120),
                width: getSize(120),
                // padding: EdgeInsets.all(getSize(15)),
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(getSize(60)),
                  color: ColorConstants.primaryColor,
                  boxShadow: getBoxShadow(),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(getSize(60)),
                  child: !isNullEmptyOrFalse(controller.profileImage)
                      ? Image.file(controller.profileImage)
                      : Image.asset(
                          logo,
                          fit: BoxFit.fill,
                        ),
                ),
              );
            },
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: InkWell(
              onTap: () {
                //Image picker done.
                showprofileImageBottomSheet(context, (img) async {
                  controller.setSelectedImage(img);
                });
              },
              child: Container(
                padding: EdgeInsets.all(getSize(2)),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstants.primaryColor,
                ),
                child: Icon(
                  Icons.add,
                  color: ColorConstants.whiteColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container getLogoutContainer() {
    return Container(
      padding: EdgeInsets.all(getSize(20)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getSize(25),
          ),
          color: ColorConstants.whiteColor,
          boxShadow: getBoxShadow()),
      child: Column(
        children: [
          getVariousOption(
              icon: Icons.logout,
              text: "Logout",
              onClick: () {
                Get.offAll(SignIn());
              }),
        ],
      ),
    );
  }

  Container getSecondContainer() {
    return Container(
      padding: EdgeInsets.all(getSize(20)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getSize(25),
          ),
          color: ColorConstants.whiteColor,
          boxShadow: getBoxShadow()),
      child: Column(
        children: [
          getVariousOption(
              icon: Icons.notification_important, text: "Notification"),
          SizedBox(
            height: getSize(15),
          ),
          getVariousOption(icon: Icons.share, text: "Invite Friends"),
          SizedBox(
            height: getSize(15),
          ),
          getVariousOption(icon: Icons.settings, text: "Setting"),
          SizedBox(
            height: getSize(15),
          ),
          getVariousOption(icon: Icons.room_service, text: "Terms of Services"),
        ],
      ),
    );
  }

  Container getFirstContainer() {
    return Container(
      padding: EdgeInsets.all(getSize(20)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getSize(25),
          ),
          color: ColorConstants.whiteColor,
          boxShadow: getBoxShadow()),
      child: Column(
        children: [
          getVariousOption(icon: Icons.payment, text: "Payments Methods"),
          SizedBox(
            height: getSize(15),
          ),
          getVariousOption(icon: Icons.info, text: "Account Information"),
        ],
      ),
    );
  }

  InkWell getVariousOption({IconData icon, String text, VoidCallback onClick}) {
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
          Icon(
            icon,
            color: ColorConstants.primaryColor,
          ),
          SizedBox(
            width: getSize(20),
          ),
          Expanded(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
