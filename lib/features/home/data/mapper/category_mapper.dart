import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/features/auth/data/mapper/resgister_mapper.dart';

import '../../domain/model/category_model.dart';
import '../response/category_response.dart';

extension CategoryMapper on CategoryResponse {
  CategoryModel toDomain() {
    return CategoryModel(
      id: id.onNull(),
      attributeCategoryModel: attributeCategoryResponse?.toDomain(),
    );
  }
}
