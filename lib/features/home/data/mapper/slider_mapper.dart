import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/features/auth/data/mapper/resgister_mapper.dart';

import '../../domain/model/slider_model.dart';
import '../response/slider_response.dart';

extension SliderMapper on SliderResponse {
  SliderModel toDomain() {
    return SliderModel(
      id: id.onNull(),
      type: type.onNull(),
      attributeModel: attributeResponse?.toDomain(),
    );
  }
}
