import 'package:act_hub/features/auth/data/mapper/login_mapper.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../../../core/resources/manager_strings.dart';
import '../data_source/remote_login_data_source.dart';
import '../request/login_request.dart';
import '../../domain/model/login.dart';
import '../../domain/repository/login_repository.dart';

class LoginRepositoryImplement implements LoginRepository {
  final RemoteLoginDataSource _remoteLoginDataSource;
  final NetworkInfo _networkInfo;
  LoginRepositoryImplement(this._remoteLoginDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Login>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      final response = await _remoteLoginDataSource.login(loginRequest);
      return Right(response.toDomain());
    } else {
      return Left(
        Failure(ResponseCode.NO_INTERNET_CONNECTION.value,
            ManagerStrings.noInternetConnection),
      );
    }
  }
}
