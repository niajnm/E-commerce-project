import 'package:e_commerce/app/base_app/controller/base_view_model.dart';
import 'package:e_commerce/app/module/user_auth/controller/auth_view_model.dart';
import 'package:e_commerce/app/module/weather/controller/weather_view_model.dart';
import 'package:provider/provider.dart';

class ProviderPath {
  static dynamic providersList = [
    ChangeNotifierProvider(create: (_) => BaseViewModel(), lazy: true),
    ChangeNotifierProvider(create: (_) => WeatherViewModel(), lazy: true),
    ChangeNotifierProvider(create: (_) => UserAuthViewModel(), lazy: true),
  ];
}
