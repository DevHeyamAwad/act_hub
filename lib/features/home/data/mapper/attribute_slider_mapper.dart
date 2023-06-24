import 'package:act_hub/core/extensions/extensions.dart';

import '../../domain/model/attribute_slider_model.dart';
import '../response/attribute_slider_response.dart';

extension AttributeSliderMapper on AttributeSliderResponse {
  AttributeSliderModel toDomain() {
    return AttributeSliderModel(
      title: title.onNull(),
      description: description.onNull(),
      image: image.onNull(),
      type: type.onNull(),
      id: id.onNull(),
    );
  }
}
