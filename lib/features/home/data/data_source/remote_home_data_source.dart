import 'package:act_hub/core/network/app_api.dart';
import 'package:act_hub/features/home/data/response/home_response.dart';

abstract class RemoteHomeDataSource {
  Future<HomeResponse> homeData();
}

class RemoteHomeDataSourceImplement extends RemoteHomeDataSource {
  final AppApi _appApi;

  RemoteHomeDataSourceImplement(this._appApi);

  @override
  Future<HomeResponse> homeData() async {
    return await _appApi.home();
  }
}
