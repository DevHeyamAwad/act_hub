import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/features/auth/data/mapper/resgister_mapper.dart';

import '../../domain/model/course_model.dart';
import '../response/course_response.dart';

extension CourseMapper on CourseResponse {
  CourseModel toDomain() {
    return CourseModel(
      id: id.onNull(),
      isRated: isRated.onNull(),
      userRate: userRate.onNull(),
      attributeCourseModel: attributeCourseResponse?.toDomain(),
    );
  }
}
