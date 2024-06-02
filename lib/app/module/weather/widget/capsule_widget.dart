import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_assesment/app/core/values/app_colors.dart';
import 'package:weather_assesment/app/core/values/app_values.dart';
import 'package:weather_assesment/app/core/values/extention.dart';
import 'package:weather_assesment/app/module/weather/widget/froster_glass.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CapsuleWidget extends StatelessWidget {
  final needDot;
  final icon;
  String? day;
  final temp;

  CapsuleWidget({Key? key, this.needDot, this.icon, this.temp, this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FrostedGlassBox(
        dotEnable: needDot,
        theWidth: 84.0.w,
        theHeight: 140.h,
        theChild: _items());
  }

  Widget _items() => Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AppValues.halfPadding + 2),
        child: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                day ?? '',
                style: context.appThemeText.bodySmall,
              ),
              SizedBox(
                height: 60.h,
                width: 60.w,
                child: ClipRRect(child: _cacheImage(icon)),
              ),
              Text(temp ?? '')
            ],
          );
        }),
      );

  Widget _cacheImage(imageUrl) => CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => const CircularProgressIndicator(
          color: AppColors.colorWhite,
        ),
        errorWidget: (context, url, error) => const Icon(Icons.cloud),
      );
}
