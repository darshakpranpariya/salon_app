import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salon_app/app/data/model/bottomSheetModel/bottom_sheet_model.dart';
import 'package:salon_app/app/data/model/user_model.dart';

class ProfileController extends GetxController {
  File profileImage;
  List<BottomSheetModel> list = [];
  UserModel user = UserModel();

  @override
  void onInit() {
    //fetchData from getstroage for getting username and emailId.
    fetchData();

    //Add language in list.
    BottomSheetModel bottomSheetModel1 = BottomSheetModel();
    bottomSheetModel1.title = "English";
    bottomSheetModel1.isSelected = true;
    list.add(bottomSheetModel1);

    BottomSheetModel bottomSheetModel2 = BottomSheetModel();
    bottomSheetModel2.title = "Hindi";
    bottomSheetModel2.isSelected = false;
    list.add(bottomSheetModel2);

    super.onInit();
  }

  fetchData() {
    final box = GetStorage();
    var jsonData = box.read("userData");
    user = UserModel.fromJson(jsonData);
  }

  setSelectedImage(File img) {
    profileImage = img;
    update();
  }
}
