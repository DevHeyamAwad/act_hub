import 'package:act_hub/config/constants.dart';
import 'package:act_hub/routes/routes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        const Duration(
          seconds: Constants.splashDuration,
        ), () {
      Get.offAllNamed(
        Routes.outBoardingView,
      );
    });
  }
}
