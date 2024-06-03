import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce/app/data/remote/end_point_api.dart';
import 'package:e_commerce/app/data/remote/remote-auth/api_model/LoginResponseModel.dart';
import 'package:e_commerce/app/data/remote/remote-auth/api_model/login_post_param.dart';
import 'package:e_commerce/app/data/remote/remote-auth/api_model/registration_post_param.dart';
import 'package:e_commerce/app/data/remote/remote-auth/auth_remote_source.dart';
import 'package:e_commerce/app/data/remote/weather_remote/model/weather_params.dart';
import 'package:e_commerce/app/data/remote/weather_remote/weather_remote_source.dart';
import '../../../core/base/base_remote_source.dart';

class AuthRemoteSourceImpl extends BaseRemoteSource
    implements AuthRemoteSource {
  @override
  Future userRegistration(RegistrationPostParam queryParams) {
    //   log('post data $queryParams');

    var endpoint = weatherBaseUrl;
    var dioCall = dioCli.get(endpoint, queryParameters: queryParams.toJson());

    try {
      return callApiWithErrorParser(dioCall).then((response) => response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponseModel> userLogin(LoginPostParams queryParams) {
    var endpoint = loginUrl;
    var dioCall = dioCli.post(endpoint, queryParameters: queryParams.toJson());

    log('login info $dioCall');

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseProductInfoResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  LoginResponseModel _parseProductInfoResponse(Response<dynamic> response) {
    log('login info 2 $response');
    return LoginResponseModel.fromJson(response.data);
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
