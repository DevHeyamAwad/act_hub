import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/features/home/data/response/attribute_category_response.dart';
import 'package:act_hub/features/home/domain/model/attribute_category_model.dart';

extension AttributeCategoryMapper on AttributeCategoryResponse {
  AttributeCategoryModel toDomain() {
    return AttributeCategoryModel(
      description: description.onNull(),
      title: title.onNull(),
      image: image.onNull(),
      type: type.onNull(),
    );
  }
}
