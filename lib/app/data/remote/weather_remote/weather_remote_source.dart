import 'package:weather_assesment/app/data/remote/weather_remote/model/weather_params.dart';

abstract class WeatherRemoteSource {
  Future<dynamic> getSevenDaysWeather(WeatherParams queryParams);
}
