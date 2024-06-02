import 'package:weather_assesment/app/base_app/controller/base_view_model.dart';
import 'package:weather_assesment/app/module/weather/controller/weather_view_model.dart';
import 'package:provider/provider.dart';

class ProviderPath {
  static dynamic providersList = [
    ChangeNotifierProvider(create: (_) => BaseViewModel(), lazy: true),
    ChangeNotifierProvider(create: (_) => WeatherViewModel(), lazy: true),
  ];
}
