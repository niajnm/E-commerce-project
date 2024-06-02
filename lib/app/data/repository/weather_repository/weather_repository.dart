import 'package:weather_assesment/app/data/remote/weather_remote/model/weather_params.dart';
import 'package:weather_assesment/app/data/remote/weather_remote/model/weather_response_model.dart';

abstract class WeatherRepository {
  Future<WeatherResponseModel> getSevenDaysWeather(WeatherParams queryParams);
}
