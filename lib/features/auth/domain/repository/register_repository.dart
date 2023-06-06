import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../data/request/registe_request.dart';
import '../model/Register.dart';

abstract class RegisterRepository {
  Future<Either<Failure, Register>> register(RegisterRequest registerRequest);
}
