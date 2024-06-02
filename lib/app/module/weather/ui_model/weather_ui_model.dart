import 'package:weather_assesment/app/core/values/image_values.dart';
import 'package:weather_assesment/app/data/remote/weather_remote/model/weather_response_model.dart';
import 'package:intl/intl.dart';

class DailyUIModel {
  final DateTime? date;
  final String? day;
  final dynamic? dayTemperature;
  final String? weatherDescription;
  final String? weatherIcon;

  DailyUIModel({
    this.date,
    this.day,
    this.dayTemperature,
    this.weatherDescription,
    this.weatherIcon,
  });

  factory DailyUIModel.fromDaily(Daily daily) {
    // Convert timestamp to DateTime
    DateTime? date = daily.dt != null
        ? DateTime.fromMillisecondsSinceEpoch(daily.dt * 1000)
        : null;

    // Map day temperature
    dynamic dayTemperature = daily.temp?.day;

    // Map weather data
    String? weatherDescription = daily.weather?.first.description ?? 'N/A';
    String? weatherIcon =
        "${ImageValues.weather_image_url}${daily.weather?.first.icon}@2x.png" ??
            'N/A';

    return DailyUIModel(
      date: date,
      day: DateFormat('EEE').format(date!),
      dayTemperature: dayTemperature,
      weatherDescription: weatherDescription,
      weatherIcon: weatherIcon,
    );
  }
}

class WeatherUIModel {
  final dynamic latitude;
  final dynamic longitude;
  final String? timezone;
  final int? timezoneOffset;
  final String? currentTemperature;
  final String? currentWeatherDescription;
  final String? currentWeatherIcon;
  final String? sunrise;
  final String? sunset;
  final String? feelsLike;
  final dynamic? pressure;
  final dynamic? humidity;
  final dynamic? dewPoint;
  final dynamic? uvi;
  final dynamic? clouds;
  final dynamic? visibility;
  final dynamic? windSpeed;
  final dynamic? windDeg;
  final dynamic? windGust;
  final List<DailyUIModel>? dailyForecasts;

  WeatherUIModel({
    this.latitude,
    this.longitude,
    this.timezone,
    this.timezoneOffset,
    this.currentTemperature,
    this.currentWeatherDescription,
    this.currentWeatherIcon,
    this.sunrise,
    this.sunset,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.dailyForecasts,
  });

  factory WeatherUIModel.fromWeatherResponse(WeatherResponseModel response) {
    // Map current weather data
    Current? current = response.current;
    String? currentTemperature = current?.temp.round().toString();
    String? currentWeatherDescription =
        current?.weather?.first.description ?? 'N/A';

    final WeatherIcon = response.current?.weather?[0].icon;

    String? currentWeatherUrl =
        "${ImageValues.weather_image_url}$WeatherIcon@2x.png";
    String? currentWeatherIcon = currentWeatherUrl ?? 'N/A';

    // Map daily forecasts
    List<DailyUIModel>? dailyForecasts =
        response.daily?.map((daily) => DailyUIModel.fromDaily(daily)).toList();

    return WeatherUIModel(
      latitude: response.lat,
      longitude: response.lon,
      timezone: response.timezone,
      timezoneOffset: response.timezoneOffset,
      currentTemperature: currentTemperature,
      currentWeatherDescription: currentWeatherDescription,
      currentWeatherIcon: currentWeatherIcon,
      sunrise:
          current?.sunrise != null ? _formatTimestamp(current?.sunrise) : null,
      sunset:
          current?.sunset != null ? _formatTimestamp(current?.sunset) : null,
      feelsLike: current?.feelsLike.toString(),
      pressure: current?.pressure,
      humidity: current?.humidity,
      dewPoint: current?.dewPoint,
      uvi: current?.uvi,
      clouds: current?.clouds,
      visibility: current?.visibility,
      windSpeed: current?.windSpeed,
      windDeg: current?.windDeg,
      windGust: current?.windGust,
      dailyForecasts: dailyForecasts,
    );
  }

  // Helper method to format timestamp to readable date/time
  static String _formatTimestamp(dynamic? timestamp) {
    if (timestamp is int) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      return DateFormat('hh:mm:s').format(date).toString();
    } else {
      return 'N/A';
    }
  }
}
