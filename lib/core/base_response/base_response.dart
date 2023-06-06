import 'package:json_annotation/json_annotation.dart';

import '../../config/constants.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: ApiConstants.message)
  String? message;
}
