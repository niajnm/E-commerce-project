import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_assesment/app/core/base/app_theme_data.dart';
import 'package:weather_assesment/app/core/base/theme.dart';
import 'package:weather_assesment/app/core/route/go_route_service.dart';
import 'package:weather_assesment/app/core/values/app_language.dart';
import 'package:weather_assesment/app/data/local/preference/preference_manager.dart';
import 'package:weather_assesment/app/data/local/preference/preference_manager_impl.dart';
import 'package:weather_assesment/app/module/weather/controller/weather_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_assesment/app/utils/location/location_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class BaseApp extends StatefulWidget {
  const BaseApp({super.key});

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  @override
  void initState() {
    super.initState();
    // checklocation(context); // Pass the BuildContext here
  }

  checklocation(BuildContext context) async {
    // Add the BuildContext parameter here
    Position? currentPosition =
        await LocationService.getLocationWithPermissionCheck();
    if (currentPosition != null) {
      Provider.of<WeatherViewModel>(context, listen: false).setCurrentLocation(
          currentPosition.latitude, currentPosition.longitude);
    } else {
      // Handle the case when the location couldn't be obtained
    }
  }

  Locale? _locale;

  @override
  Widget build(BuildContext context) {
    String appLanguage = _preference.getString(
      PreferenceManager.appLanguage,
      defaultValue: AppLanguage.en.name,
    );

    final Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
        designSize: screenSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) {
          return MaterialApp.router(
            key: navigatorKey,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: getSupportedLocal(),
            locale: _locale,
            title: "",
            theme: _getTheme(appLanguage),
            debugShowCheckedModeBanner: false,
            routerConfig: GoRouterService.router,
          );
        });
  }

  final PreferenceManager _preference = PreferenceManagerImpl();

  ThemeData _getTheme(String appLanguage) {
    String savedTheme = _preference.getString(PreferenceManager.theme);
    //String savedTheme = "AppTheme.DARK";

    if (savedTheme == AppTheme.DARK.toString()) {
      return AppThemeData.getDarkTheme(appLanguage);
    } else if (savedTheme == AppTheme.LIGHT.toString()) {
      return AppThemeData.lightThemeFlex(appLanguage);
    } else {
      return _getThemeSameAsSystem(appLanguage);
    }
  }

  ThemeData _getThemeSameAsSystem(String appLanguage) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return isDarkMode
        ? AppThemeData.getDarkTheme(appLanguage)
        : AppThemeData.lightThemeFlex(appLanguage);
  }
}
