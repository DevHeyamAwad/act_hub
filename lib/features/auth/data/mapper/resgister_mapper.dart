import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/features/auth/data/response/register_response.dart';
import '../../domain/model/Register.dart';

extension RegisterMapper on RegisterResponse {
  toDomain() {
    return Register(status: status.onNull());
  }
}
