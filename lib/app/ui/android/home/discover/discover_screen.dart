import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app/app/controller/home_controller/discover/discover_controller.dart';
import 'package:salon_app/app/ui/constants/image_constants.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_theme.dart';
import '../../../utils/common_textfield.dart';
import '../../../utils/math_utils.dart';
import 'package:salon_app/app/routes/app_pages.dart';
// import 'package:salon_app/app/routes/app_routes.dart';

class DiscoverScreen extends StatelessWidget {
  final controller = Get.put<DiscoverController>(DiscoverController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: getSize(20)),
            child: GetBuilder(
              init: controller,
              builder: (controller) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Hi ",
                            style: black16TextStyle.copyWith(
                                fontSize: getSize(20),
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Theresa Cohen,",
                                style: black16TextStyle.copyWith(
                                  fontSize: getSize(20),
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.NOTIFICATION),
                          child: Icon(
                            Icons.notifications,
                            color: ColorConstants.primaryColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getSize(15),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: getSize(18),
                        ),
                        Text(
                          "301 Dorthy Walks,Chicago,Us.",
                          style: black16TextStyle,
                        )
                      ],
                    ),
                    SizedBox(
                      height: getSize(20),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: CommonTextfield(
                                borderRadius: 10,
                                textOption: TextFieldOption(
                                    hintText: "Find salon specialist",
                                    maxLine: 1),
                                textCallback: (value) {}),
                          ),
                          InkWell(
                            onTap: () {
                              controller.setTheme();
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: getSize(10)),
                              padding:
                                  EdgeInsets.symmetric(horizontal: getSize(10)),
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstants.dividerColor),
                                  borderRadius: BorderRadius.circular(10)
                                  // image:
                                  ),
                              child: Icon(Icons.sort),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getSize(15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Best Specialists",
                          style: black18TitleTextStyle,
                        ),
                        Text(
                          "View all",
                          style: black16TextStyle.copyWith(
                              color: ColorConstants.primaryColor),
                        )
                      ],
                    ),
                    Container(
                      height: getSize(200),
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              vertical: getSize(10), horizontal: 5),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Get.toNamed(Routes.DETAILS),
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 2.0,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: getSize(120),
                                      width: getSize(120),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          child: Image.asset(
                                            logo,
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Joseph Drake",
                                        style: black18TitleTextStyle.copyWith(
                                            fontSize: getSize(16)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Makeup Artist",
                                        style: black16TextStyle.copyWith(
                                            fontSize: getSize(13),
                                            color: ColorConstants.greyText),
                                      ),
                                    ),
                                    SizedBox(
                                      height: getSize(10),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: getSize(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Special Offers",
                          style: black18TitleTextStyle,
                        ),
                        Text(
                          "View all",
                          style: black16TextStyle.copyWith(
                              color: ColorConstants.primaryColor),
                        )
                      ],
                    ),
                    Container(
                      height: getSize(200),
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              vertical: getSize(10), horizontal: 5),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 2.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: getSize(120),
                                    width: getSize(200),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        child: Image.asset(
                                          logo,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Joseph Drake",
                                      style: black18TitleTextStyle.copyWith(
                                          fontSize: getSize(16)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Makeup Artist",
                                      style: black16TextStyle.copyWith(
                                          fontSize: getSize(13),
                                          color: ColorConstants.greyText),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getSize(10),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Best Specialists",
                          style: black18TitleTextStyle,
                        ),
                        Text(
                          "View all",
                          style: black16TextStyle.copyWith(
                              color: ColorConstants.primaryColor),
                        )
                      ],
                    ),
                    Container(
                      height: getSize(200),
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              vertical: getSize(10), horizontal: 5),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 2.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: getSize(120),
                                    width: getSize(120),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        child: Image.asset(
                                          logo,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Joseph Drake",
                                      style: black18TitleTextStyle.copyWith(
                                          fontSize: getSize(16)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Makeup Artist",
                                      style: black16TextStyle.copyWith(
                                          fontSize: getSize(13),
                                          color: ColorConstants.greyText),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getSize(10),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: getSize(10),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
