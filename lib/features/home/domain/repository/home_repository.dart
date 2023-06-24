import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../model/home_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> home();
}
