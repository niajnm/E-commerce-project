import 'dart:developer';
import 'package:weather_assesment/app/data/remote/end_point_api.dart';
import 'package:weather_assesment/app/data/remote/weather_remote/model/weather_params.dart';
import 'package:weather_assesment/app/data/remote/weather_remote/weather_remote_source.dart';
import '../../../core/base/base_remote_source.dart';

class WeatherRemoteSourceImpl extends BaseRemoteSource
    implements WeatherRemoteSource {
  @override
  Future<dynamic> getSevenDaysWeather(WeatherParams queryParams) {
    log('post data $queryParams');

    var endpoint = weatherBaseUrl;
    var dioCall = dioCli.get(endpoint, queryParameters: queryParams.toJson());

    try {
      return callApiWithErrorParser(dioCall).then((response) => response);
    } catch (e) {
      rethrow;
    }
  }
}
