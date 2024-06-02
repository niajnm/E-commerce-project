import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:e_commerce/app/core/services/service_locator.dart';
import 'package:e_commerce/app/data/remote/weather_remote/model/weather_params.dart';
import 'package:e_commerce/app/data/remote/weather_remote/model/weather_response_model.dart';
import 'package:e_commerce/app/data/remote/weather_remote/weather_remote_source.dart';
import 'package:e_commerce/app/data/repository/auth_repository/auth_repository.dart';
import 'package:e_commerce/app/utils/internet_connection.dart';


class AuthRepositoryImpl implements AuthRepository {
  final WeatherRemoteSource _remoteSource =
      serviceLocator<WeatherRemoteSource>();

  @override
  Future<WeatherResponseModel> getSevenDaysWeather(
      WeatherParams queryParams) async {
    bool isConnected = await InternetConnect.isInternetConnected();
    if (isConnected) {
      var apiRresponse = await _remoteSource.getSevenDaysWeather(queryParams);

      log('Device is connected to the internet.');

      return _parseSevenDaysWeatherResponse(apiRresponse);
    } else {
      log('Device is not connected to the internet.');
      return _parseSevenDaysWeatherResponseFromHive();
    }
  }

  Future<WeatherResponseModel> _parseSevenDaysWeatherResponseFromHive() async {
    var box = await Hive.openBox<String>('json_data');
    String? storedJsonData = box.get('data');

    // Close the box when done with it
    //await box.close();

    if (storedJsonData != null) {
      log('Stored JSON Datafrom hive : $storedJsonData');

      return WeatherResponseModel.fromJson(json.decode(storedJsonData));
    } else {
      return WeatherResponseModel.fromJson(json.decode(storedJsonData!));
    }
  }

  Future<WeatherResponseModel> _parseSevenDaysWeatherResponse(
      Response<dynamic> response) async {
    var box = await Hive.openBox<String>('json_data');

    await box.clear();
    String jsonData = "$response";
    await box.put('data', jsonData);

    log(' Weather response  $response');
    var result = WeatherResponseModel.fromJson(response.data);
    return result;
  }
  
  @override
  Future userLogin(queryParams) {
    // TODO: implement userLogin
    throw UnimplementedError();
  }
  
  @override
  Future userRegistration(queryParams) {
    // TODO: implement userRegistration
    throw UnimplementedError();
  }
}
