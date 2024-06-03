import 'dart:developer';
import 'package:e_commerce/app/data/local/preference/preference_manager.dart';
import 'package:e_commerce/app/data/remote/remote-auth/api_model/LoginResponseModel.dart';
import 'package:e_commerce/app/data/remote/remote-auth/api_model/login_post_param.dart';
import 'package:e_commerce/app/data/repository/auth_repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_commerce/app/core/services/service_locator.dart';
import 'package:e_commerce/app/data/remote/weather_remote/model/weather_params.dart';
import 'package:e_commerce/app/data/remote/weather_remote/model/weather_response_model.dart';
import 'package:e_commerce/app/data/repository/weather_repository/weather_repository.dart';
import 'package:e_commerce/app/module/weather/ui_model/weather_ui_model.dart';
import 'package:e_commerce/app/utils/location/location_service.dart';
import 'package:geolocator/geolocator.dart';

class UserAuthViewModel extends ChangeNotifier {
  final WeatherRepository _weatherRepository =
      serviceLocator<WeatherRepository>();

  final AuthRepository _authenticationRepository =
      serviceLocator<AuthRepository>();

  String? cityName = 'Loading..!';

  WeatherUIModel? weatherData;

  Future<LoginResponseModel> logInApiService(userName, userPassword) async {
    final userRepository = serviceLocator<PreferenceManager>();

    LoginPostParams param =
        LoginPostParams(userName: userName, pass: userPassword);
    log('login param $userName $userPassword');
    LoginResponseModel response =
        await _authenticationRepository.userLogin(param);

    log('login param $userName $userPassword');

    if (response.token != null) {
      userRepository.setString("token", "$response.token");
      return response;
    } else {
      // var error = LoginResponseModel(
      //     statusCode: response['status_code'],
      //     result: null,
      //     message: response['message']);
      // return error;

      return response;
    }
  }

  Future<LoginResponseModel> userResistation(userName, userPassword) async {
    final userRepository = serviceLocator<PreferenceManager>();

    LoginPostParams param =
        LoginPostParams(userName: userName, pass: userPassword);
    log('login param $userName $userPassword');
    LoginResponseModel response =
        await _authenticationRepository.userLogin(param);

    log('login param $userName $userPassword');

    if (response.token != null) {
      userRepository.setString("token", "$response.token");
      return response;
    } else {
      // var error = LoginResponseModel(
      //     statusCode: response['status_code'],
      //     result: null,
      //     message: response['message']);
      // return error;

      return response;
    }
  }
}
