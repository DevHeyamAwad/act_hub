import 'package:act_hub/core/extensions/extensions.dart';

import '../../domain/model/login.dart';
import '../response/login_response.dart';

extension LoginMapper on LoginResponse {
  toDomain() {
    return Login(token: token.onNull());
  }
}
