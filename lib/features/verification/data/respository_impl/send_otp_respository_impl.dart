import 'package:act_hub/features/auth/data/mapper/resgister_mapper.dart';
import 'package:act_hub/features/verification/domain/repositories/send_otp_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../config/constants.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../domain/model/send_otp_model.dart';
import '../data_source/send_otp_remote_date_source.dart';
import '../request/send_otp_request.dart';

class SendOtpRepositoryImpl implements SendOtpRepository {
  final RemoteSendOtpDataSource _remoteSendOtpDataSource;
  final NetworkInfo _networkInfo;

  SendOtpRepositoryImpl(this._networkInfo, this._remoteSendOtpDataSource);

  @override
  Future<Either<Failure, SendOtpModel>> sendOtp(
      SendOtpRequest sendOtpRequest) async {
    if (await _networkInfo.isConnected) {
      /// Its connected
      try {
        final response = await _remoteSendOtpDataSource.sendOtp(sendOtpRequest);
        if (response.status != null) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(ResponseCode.BAD_REQUEST.value, ""));
        }
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          ResponseCode.NO_INTERNET_CONNECTION.value,
          ApiConstants.noInternetConnection,
        ),
      );
    }
  }
}
