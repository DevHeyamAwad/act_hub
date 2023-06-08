import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/features/home/data/response/attribute_course_response.dart';
import 'package:act_hub/features/home/domain/model/attribute_course_model.dart';

extension AttributeCourseMapper on AttributeCourseResponse {
  AttributeCourseModel toDomain() {
    return AttributeCourseModel(
      active: active.onNull(),
      avatar: avatar.onNull(),
      description: description.onNull(),
      endDate: endDate.onNull(),
      hours: hours.onNull(),
      price: price.onNull(),
      rate: rate.onNull(),
      resourceId: resourceId.onNull(),
      startDate: startDate.onNull(),
      title: title.onNull(),
    );
  }
}
