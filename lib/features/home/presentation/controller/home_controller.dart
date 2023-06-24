import 'package:act_hub/config/dependency_injection.dart';
import 'package:act_hub/features/home/domain/model/category_model.dart';
import 'package:act_hub/features/home/domain/usecase/home_usecase.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/state_render/state_renderer.dart';
import '../../domain/model/course_model.dart';
import '../../domain/model/slider_model.dart';

class HomeController extends GetxController {
  late CarouselController carouselController;
  int selectedCategoryIndex = 0;
  int current = 0;

  List<SliderModel> sliders = [];

  List<CourseModel> popularCourses = [];

  List<CategoryModel> categories = [];

  final HomeUseCase _homeUseCase = instance<HomeUseCase>();

  @override
  void onInit() {
    super.onInit();
    home();
    carouselController = CarouselController();
  }

  void change(int index) {
    current = index;
    update();
  }

  void selectCategory(int index) {
    selectedCategoryIndex = index;
    update();
  }

  Future<void> home() async {
    BuildContext context = Get.context as BuildContext;
    (await _homeUseCase.execute()).fold((l) {
      dialogRender(
          context: context,
          stateRenderType: StateRenderType.popUpErrorState,
          message: l.message,
          title: '',
          retryAction: () {
            Get.back();
          });
    }, (r) {
      sliders = r.sliders!;
      categories = r.categories!;
      popularCourses = r.courses!;
      update();
    });
  }

  courseHoursFormat(int index) {
    return "${popularCourses[index].attributeCourseModel!.hours.toString()} hour";
  }
}
