import 'package:act_hub/core/error_handler/error_handler.dart';
import 'package:act_hub/features/home/domain/model/home_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_case/base_use_case.dart';
import '../repository/home_repository.dart';

class HomeUseCase implements BaseOutUseCase {
  final HomeRepository _homeRepository;

  HomeUseCase(this._homeRepository);

  @override
  Future<Either<Failure, HomeModel>> execute() async {
    return await _homeRepository.home();
  }
}
