import 'package:e_commerce/app/data/remote/weather_remote/model/weather_params.dart';

abstract class AuthRemoteSource {
  Future<dynamic> userRegistration(WeatherParams queryParams);
  Future<dynamic> userLogin(WeatherParams queryParams);
}
