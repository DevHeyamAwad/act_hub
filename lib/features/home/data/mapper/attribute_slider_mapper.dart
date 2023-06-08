import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/features/home/data/response/attribute_slider_response.dart';
import 'package:act_hub/features/home/domain/model/attribute_slider_model.dart';

extension AttributeSliderMapper on AttributeSliderResponse {
  AttributeSliderModel toDomain() {
    return AttributeSliderModel(
      description: description.onNull(),
      id: id.onNull(),
      image: image.onNull(),
      title: title.onNull(),
      type: type.onNull(),
    );
  }
}
