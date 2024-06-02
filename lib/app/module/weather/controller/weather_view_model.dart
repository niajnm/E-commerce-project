import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:weather_assesment/app/core/services/service_locator.dart';
import 'package:weather_assesment/app/data/remote/weather_remote/model/weather_params.dart';
import 'package:weather_assesment/app/data/remote/weather_remote/model/weather_response_model.dart';
import 'package:weather_assesment/app/data/repository/weather_repository/weather_repository.dart';
import 'package:weather_assesment/app/module/weather/ui_model/weather_ui_model.dart';
import 'package:weather_assesment/app/utils/location/location_service.dart';
import 'package:geolocator/geolocator.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository _weatherRepository =
      serviceLocator<WeatherRepository>();

  String? cityName = 'Loading..!';

  WeatherUIModel? weatherData;

  checklocation() async {
    Position? currentPosition =
        await LocationService.getLocationWithPermissionCheck();
    if (currentPosition != null) {
      setCurrentLocation(currentPosition.latitude, currentPosition.longitude);
    } else {
      checklocation();
      // Handle the case when the location couldn't be obtained
    }
  }

  getWeather() async {
    await checklocation();

    if (getLat != null) {
      var queryParams =
          WeatherParams(lat: getLat.toString(), lon: getLon.toString());
      //  cityName = await LocationSer.getCityName(getLat, getLon);

      WeatherResponseModel response =
          await _weatherRepository.getSevenDaysWeather(queryParams);

      WeatherUIModel weatherUIModel =
          WeatherUIModel.fromWeatherResponse(response);

      weatherData = weatherUIModel;
      cityName = weatherData?.timezone;
      notifyListeners();
    } else {
      await checklocation();
      getWeather();
    }
  }

  var _currentLat;
  var _currentLon;

  void setCurrentLocation(Lat, Lon) {
    _currentLat = Lat;
    _currentLon = Lon;
  }

  get getLat => _currentLat;
  get getLon => _currentLon;
}
