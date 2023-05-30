import 'package:act_hub/core/error_handler/error_handler.dart';
import 'package:act_hub/features/auth/data/request/login_request.dart';
import 'package:act_hub/features/auth/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_case/base_use_case.dart';
import '../model/login.dart';

class LoginUseCaseInput {
  String? email;
  String? password;

  LoginUseCaseInput({
    required this.email,
    required this.password,
  });
}

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Login> {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  @override
  Future<Either<Failure, Login>> execute(LoginUseCaseInput input) async {
    return await _loginRepository.login(
      LoginRequest(
        email: input.email,
        password: input.password,
      ),
    );
  }
}
