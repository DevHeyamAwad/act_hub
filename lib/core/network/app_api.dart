import 'package:retrofit/http.dart';
import '../../config/constants.dart';
import 'package:dio/dio.dart';

import '../../config/request_constants.dart';
import '../../features/auth/data/response/login_response.dart';
import '../../features/auth/data/response/register_response.dart';
import '../../features/home/data/response/home_response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppApi {
  factory AppApi(
    Dio dio, {
    String baseUrl,
  }) = _AppApi;

  @POST(RequestConstants.login)
  Future<LoginResponse> login(
      @Field(ApiConstants.email) email, @Field(ApiConstants.password) password);

  @POST(RequestConstants.register)
  Future<RegisterResponse> register(
    @Field(ApiConstants.name) name,
    @Field(ApiConstants.email) email,
    @Field(ApiConstants.password) password,
    @Field(ApiConstants.passwordConfirmation) passwordConfirmation,
    @Field(ApiConstants.phone) phone,
  );

  @GET(RequestConstants.home)
  Future<HomeResponse> home();
}
