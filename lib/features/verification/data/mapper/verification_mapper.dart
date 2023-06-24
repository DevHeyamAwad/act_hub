import 'package:act_hub/core/extensions/extensions.dart';

import '../../domain/model/verification_model.dart';
import '../response/verification_response.dart';

extension VerificationMapper on VerificationResponse {
  VerificationModel toDomain() {
    return VerificationModel(
      status: status.onNull(),
    );
  }
}
