import 'package:get/get.dart';
import 'package:onyx_test/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed(Routes.LOGIN_SCREEN);
      },
    );
    super.onInit();
  }
}
