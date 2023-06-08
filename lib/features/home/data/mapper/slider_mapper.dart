import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/features/home/data/response/sliders_response.dart';
import 'package:act_hub/features/home/domain/model/slider_model.dart';
import 'package:act_hub/features/home/data/mapper/attribute_slider_mapper.dart';

extension SliderMapper on SliderResponse {
  SliderModel toDomain() {
    return SliderModel(
      id: id.onNull(),
      type: type.onNull(),
      attributeModel: attributeResponse?.toDomain(),
    );
  }
}
