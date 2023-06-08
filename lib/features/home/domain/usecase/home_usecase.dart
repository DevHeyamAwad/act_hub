import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../model/home_model.dart';
import '../repository/home_repository.dart';

class HomeUseCase implements BaseOutUseCase {
  final HomeRepository _homeRepository;

  HomeUseCase(this._homeRepository);

  @override
  Future<Either<Failure, HomeModel>> execute() async {
    return await _homeRepository.home();
  }
}
