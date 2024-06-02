import 'dart:developer';
import 'package:e_commerce/app/data/remote/end_point_api.dart';
import 'package:e_commerce/app/data/remote/remote-auth/auth_remote_source.dart';
import 'package:e_commerce/app/data/remote/weather_remote/model/weather_params.dart';
import 'package:e_commerce/app/data/remote/weather_remote/weather_remote_source.dart';
import '../../../core/base/base_remote_source.dart';

class AuthRemoteSourceImpl extends BaseRemoteSource
    implements AuthRemoteSource {
  @override
  Future userRegistration(WeatherParams queryParams) {
    // TODO: implement userRegistration
    throw UnimplementedError();
  }

  @override
  Future userLogin(WeatherParams queryParams) {
    // TODO: implement userLogin
    throw UnimplementedError();
  }
  // @override
  // Future<dynamic> getSevenDaysWeather(WeatherParams queryParams) {
  //   log('post data $queryParams');

  //   var endpoint = weatherBaseUrl;
  //   var dioCall = dioCli.get(endpoint, queryParameters: queryParams.toJson());

  //   try {
  //     return callApiWithErrorParser(dioCall).then((response) => response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
