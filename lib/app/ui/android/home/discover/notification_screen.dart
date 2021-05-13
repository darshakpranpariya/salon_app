import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app/app/ui/constants/image_constants.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';
import '../../../utils/math_utils.dart';
import '../../../utils/math_utils.dart';
import '../../../utils/math_utils.dart';
import '../../../utils/math_utils.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          "Notification",
          style: black18TitleTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.clear,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getSize(20), vertical: getSize(8)),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10)),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Image.asset(
                      logo,
                      width: getSize(80),
                      height: getSize(80),
                      fit: BoxFit.fill,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Sherman Shop",
                              style: black18TitleTextStyle.copyWith(
                                  fontSize: getSize(16)),
                            ),
                            Text(
                              "Hi Jakson..",
                              style: black16TextStyle.copyWith(
                                  fontSize: getSize(13),
                                  color: ColorConstants.greyText),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Just Now",
                          style: black16TextStyle.copyWith(
                              fontSize: getSize(13),
                              color: ColorConstants.greyText),
                        ),
                        Icon(
                          Icons.phone_in_talk_outlined,
                          color: ColorConstants.primaryColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
