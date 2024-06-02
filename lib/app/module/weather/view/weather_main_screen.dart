import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_assesment/app/core/values/app_colors.dart';
import 'package:weather_assesment/app/core/values/app_values.dart';
import 'package:weather_assesment/app/core/values/extention.dart';
import 'package:weather_assesment/app/core/values/style_sheet.dart';
import 'package:weather_assesment/app/core/values/text_style.dart';
import 'package:weather_assesment/app/module/weather/controller/weather_view_model.dart';
import 'package:weather_assesment/app/module/weather/widget/box_tile.dart';
import 'package:weather_assesment/app/module/weather/widget/capsule_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../ui_model/weather_ui_model.dart';

class WeatherMainScreen extends StatefulWidget {
  const WeatherMainScreen({super.key});

  @override
  State<WeatherMainScreen> createState() => _WeatherMainScreenState();
}

class _WeatherMainScreenState extends State<WeatherMainScreen> {
  @override
  void initState() {
    super.initState();
    _getSevenDaysWeatherList();
  }

  _getSevenDaysWeatherList() async {
    await Provider.of<WeatherViewModel>(context, listen: false).getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _appBackground(),
            Column(
              children: [
                _cityName(),
                _currrentLocationWidget(),
                Consumer<WeatherViewModel>(
                    builder: (context, viewModel, child) {
                  var data = viewModel.weatherData;
                  return data != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _weatherTempSec(data.currentTemperature!,
                                data.currentWeatherIcon),
                            _weatherDescription(data),
                            _dailyForecast(data.dailyForecasts!),
                            _bottomStatusColumn(data)
                          ],
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.appBarColor,
                          ),
                        );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _appBackground() => Container(
        decoration: appBgBoxDecorationStyle,
      );

  Widget _cityName() => Consumer<WeatherViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15).r,
            child: Text(
              viewModel.cityName!,
              style: context.appThemeText.headlineMedium,
            ),
          );
        },
      );

  Widget _currrentLocationWidget() => Builder(builder: (context) {
        return InkWell(
          onTap: () => _getSevenDaysWeatherList(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.gps_fixed),
              Padding(
                padding: const EdgeInsets.all(AppValues.halfPadding).r,
                child: Text(context.lanValue.currentLocation),
              )
            ],
          ),
        );
      });

  Widget _weatherDescription(WeatherUIModel data) => Padding(
        padding: const EdgeInsets.only(bottom: AppValues.basePadding * 2).r,
        child: Text(
          "${data.currentWeatherDescription} - ${data.uvi}",
          style: context.appThemeText.headlineSmall,
        ),
      );

  Widget _dailyForecast(List<DailyUIModel> forecastList) => SizedBox(
        height: AppValues.height_200.h,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: forecastList.length,
          itemBuilder: (context, index) {
            return _paddingSymHozt(
              AppValues.halfPadding,
              CapsuleWidget(
                needDot: index == 0,
                day: forecastList[index].day,
                icon: forecastList[index].weatherIcon,
                temp: "${forecastList[index].dayTemperature!.round()}°",
              ),
            );
          },
        ),
      );

  Widget _weatherTempSec(temp, icon) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 140.h,
            width: 130.w,
            child: ClipRRect(
              child: _cacheImage(icon),
            ),
          ),
          SizedBox(width: AppValues.height_25.w),
          Text(
            '$temp°',
            style: context.appThemeText.displayLarge
                ?.copyWith(fontSize: AppValues.fontSize_80.sp),
          )
        ],
      );

  Widget _cacheImage(imageUrl) => CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        placeholder: (context, url) => const CircularProgressIndicator(
          color: AppColors.colorWhite,
        ),
        errorWidget: (context, url, error) => const Icon(Icons.close),
      );

  Widget _bottomStatusColumn(WeatherUIModel weatherData) =>
      Builder(builder: (context) {
        return Column(
          children: [
            BoxTile(
              firstTitle: context.lanValue.sunRise,
              firstDesc: weatherData.sunrise,
              secondTitle: context.lanValue.sunSet,
              secondDesc: weatherData.sunset,
            ),
            BoxTile(
              firstTitle: context.lanValue.feelsLike,
              firstDesc: weatherData.feelsLike,
            )
          ],
        );
      });

  Widget _paddingSymHozt(padding, child) => Padding(
      padding: EdgeInsets.symmetric(horizontal: padding).r, child: child);
}
