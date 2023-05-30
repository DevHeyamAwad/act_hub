import 'package:act_hub/core/error_handler/error_handler.dart';
import 'package:act_hub/features/auth/domain/model/login.dart';
import 'package:dartz/dartz.dart';

import '../../data/request/login_request.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> login(LoginRequest loginRequest);
}
