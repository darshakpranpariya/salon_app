import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salon_app/app/data/model/user_model.dart';

class ProfileController extends GetxController {
  File profileImage;
  UserModel user = UserModel();

  @override
  void onInit() {
    fetchData();
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
