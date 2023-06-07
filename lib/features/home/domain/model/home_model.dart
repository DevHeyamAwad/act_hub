import 'package:act_hub/features/home/domain/model/category_model.dart';
import 'slider_model.dart';
import '../../../../core/base_model.dart';
import 'course_model.dart';

class HomeModel extends BaseModel {
  List<SliderModel>? sliders;
  List<CategoryModel>? categories;
  List<CourseModel>? courses;

  HomeModel({
    this.sliders,
    this.categories,
    this.courses,
    super.message,
  });
}
