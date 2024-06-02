import 'package:e_commerce/app/data/remote/weather_remote/model/weather_params.dart';

abstract class WeatherRemoteSource {
  Future<dynamic> getSevenDaysWeather(WeatherParams queryParams);
}
