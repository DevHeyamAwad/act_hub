import 'package:act_hub/config/constants.dart';
import 'package:act_hub/core/resources/manager_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_assets.dart';
import '../view/widget/out_boarding_item.dart';

class OutBoardingController extends GetxController {
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

  void setCurrentPage(int index) {
    currentPage = index;
    update();
  }

  void skipPage() {
    //_customAnimateToPage(page: lastPage);
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
      //should use this _customAnimateToPage(page: ++currentPage,);
      pageController.animateToPage(
        ++currentPage,
        duration: const Duration(seconds: Constants.outBoardingDurationTime),
        curve: Curves.fastLinearToSlowEaseIn,
      );
      update();
    }
  }

  bool isLasedPage() {
    //TODO:fun. name should be isLastPape()
    return currentPage <
        lastPage; //or this body should be=> retrun currentPage==lastPage;
  }
  //need these two functions
  /*
  void previousPage() {
      if (!isFirstPage()) {
        _customAnimateToPage(
          page: --currentPage,
        );
        update();
      }
    }

    bool isFirstPage() {
    return currentPage == 0;
  }
  */

  bool showBackButton() {
    return currentPage > firstPage && currentPage < lastPage;
  }
  //TODO: animateToPage function is duplicated code so we should use custom function
  /*
  void _customAnimateToPage({int? page}) {
    pageController.animateToPage(
      page ?? currentPage,
      duration: const Duration(seconds: Constants.outBoardingDurationTime),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }
  */
}
