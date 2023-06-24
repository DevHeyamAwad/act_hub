import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../data/request/verfification_request.dart';
import '../model/verification_model.dart';

abstract class VerificationRepository {
  Future<Either<Failure, VerificationModel>> verifyEmail(
    VerificationRequest verificationRequest,
  );
}
