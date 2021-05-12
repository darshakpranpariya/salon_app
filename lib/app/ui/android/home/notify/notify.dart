import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:salon_app/app/controller/notify_controllers/notify_controller.dart';
import 'package:salon_app/app/data/model/posts_model.dart';
import 'package:salon_app/app/ui/theme/app_colors.dart';
import 'package:salon_app/app/ui/theme/app_text_theme.dart';
import 'package:salon_app/app/ui/utils/base/BaseList.dart';
import 'package:salon_app/app/ui/utils/common_widgets.dart';
import 'package:salon_app/app/ui/utils/math_utils.dart';

class Notify extends StatelessWidget {
  final controller = Get.put<NotifyController>(NotifyController());
  // RefreshController refreshController =
  //     RefreshController(initialRefresh: false);

  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          getBackButton(),
          SizedBox(
            height: getSize(50),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getSize(25),
                  ),
                  topRight: Radius.circular(
                    getSize(25),
                  ),
                ),
              ),
              child: GetBuilder<NotifyController>(
                init: controller,
                builder: (controller) {
                  return BaseList(
                    controller: controller.pagingController,
                    pagedListView: PagedListView(
                      pagingController: controller.pagingController,
                      builderDelegate: PagedChildBuilderDelegate(
                        itemBuilder: (context, item, index) {
                          return Text(item.title);
                        },
                        firstPageErrorIndicatorBuilder: (_) =>
                            FirstPageErrorIndicator(
                          onTryAgain: () =>
                              controller.pagingController.refresh(),
                        ),
                        newPageErrorIndicatorBuilder: (_) =>
                            NewPageErrorIndicator(
                          onTryAgain: () => controller.pagingController
                              .retryLastFailedRequest(),
                        ),
                        firstPageProgressIndicatorBuilder: (_) =>
                            FirstPageProgressIndicator(),
                        newPageProgressIndicatorBuilder: (_) =>
                            NewPageProgressIndicator(),
                        noItemsFoundIndicatorBuilder: (_) =>
                            NoItemsFoundIndicator(),
                        noMoreItemsIndicatorBuilder: (_) =>
                            NoMoreItemsIndicator(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
