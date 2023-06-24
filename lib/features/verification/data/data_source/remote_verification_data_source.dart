import '../../../../core/network/app_api.dart';
import '../request/verfification_request.dart';
import '../response/verification_response.dart';

abstract class RemoteVerificationDataSource {
  Future<VerificationResponse> verification(
      VerificationRequest verificationRequest);
}

class RemoteVerificationDataSourceImplementation
    extends RemoteVerificationDataSource {
  final AppApi _appApi;

  RemoteVerificationDataSourceImplementation(this._appApi);

  @override
  Future<VerificationResponse> verification(
      VerificationRequest verificationRequest) {
    return _appApi.emailVerification(
      verificationRequest.email,
      verificationRequest.otp,
    );
  }
}
