import 'package:get/get.dart';
import 'package:salon_app/app/ui/theme/app_colors.dart';
import 'package:salon_app/app/ui/theme/app_theme.dart';

class DiscoverController extends GetxController {
  bool themeBool = true;

  setTheme() {
    themeBool = !themeBool;
    if (themeBool) {
      Get.changeTheme(appThemeData);
    } else {
      Get.changeTheme(appThemeDatadark);
      ColorConstants.textColor = ColorConstants.whiteColor;
    }
    update();
  }
}
