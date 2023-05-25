import 'package:act_hub/config/constants.dart';
import 'package:act_hub/config/dependency_injection.dart';
import 'package:act_hub/core/resources/manager_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_assets.dart';
import '../../../../core/storage/local/app_settings_shared_preferences.dart';
import '../../../../routes/routes.dart';
import '../view/widget/out_boarding_item.dart';

class OutBoardingController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();
  late PageController pageController;
  static const firstPage = 0;
  static const lastPage = 2;
  int currentPage = firstPage;

  final List pageViewItems = [
    OutBoardingItem(
      image: ManagerAssets.outBoardingIllustration1,
      title: ManagerStrings.outBoardingTitle1,
      subTitle: ManagerStrings.outBoardingSubTitle1,
    ),
    OutBoardingItem(
      image: ManagerAssets.outBoardingIllustration2,
      title: ManagerStrings.outBoardingTitle2,
      subTitle: ManagerStrings.outBoardingSubTitle2,
    ),
    OutBoardingItem(
      image: ManagerAssets.outBoardingIllustration3,
      title: ManagerStrings.outBoardingTitle3,
      subTitle: ManagerStrings.outBoardingSubTitle3,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  Future<void> setCurrentPage(int index) async {
    await _appSettingsSharedPreferences.setOutBoardingViewed();
    currentPage = index;
    update();
  }

  Future<void> getStart() async {
    await _appSettingsSharedPreferences.setOutBoardingViewed();
    Get.offAllNamed(Routes.loginView);
  }

  void skipPage() {
    pageController.animateToPage(
      lastPage,
      duration: const Duration(seconds: Constants.outBoardingDurationTime),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    currentPage = lastPage;
    update();
  }

  void nextPage() {
    if (isLasedPage()) {
      animatedToPage(index: ++currentPage);
      update();
    }
  }

  bool isLasedPage() {
    return currentPage < lastPage;
  }

  void previousPage() {
    if (isNotLasedPage()) {
      animatedToPage(index: --currentPage);
      update();
    }
  }

  void animatedToPage({required int index}) {
    pageController.animateToPage(
      index,
      duration: const Duration(seconds: Constants.outBoardingDurationTime),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  bool isNotLasedPage() {
    return currentPage > lastPage;
  }

  bool showBackButton() {
    return currentPage > firstPage && currentPage < lastPage;
  }
}
