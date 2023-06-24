import 'package:act_hub/features/auth/data/mapper/resgister_mapper.dart';
import 'package:dartz/dartz.dart';
import '../../../../config/constants.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../../domain/model/home_model.dart';
import '../../domain/repository/home_repository.dart';
import '../data_source/remote_home_data_source.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final RemoteHomeDataSource _dataSource;
  final NetworkInfo _networkInfo;

  HomeRepositoryImplementation(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, HomeModel>> home() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.homeData();
        return Right(response.toDomain());
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
