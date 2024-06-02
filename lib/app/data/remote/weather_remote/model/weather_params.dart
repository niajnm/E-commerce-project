import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherParams {
  String lat;
  String lon;

  WeatherParams({
    required this.lat,
    required this.lon,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    data['units'] = "metric";
    //data['appid'] = dotenv.env['WEATHER_API'];
    data['appid'] = '95fd4c795f2bd4c408a327937cc31a17';

    data['exclude'] = "minutely,hourly";

    return data;
  }
}
