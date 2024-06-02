import 'package:flutter/material.dart';
import 'package:weather_assesment/app/core/values/app_values.dart';
import 'package:weather_assesment/app/core/values/extention.dart';
import 'package:weather_assesment/app/core/values/style_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxTile extends StatelessWidget {
  final icon;
  final firstTitle;
  final secondTitle;
  final firstDesc;
  final secondDesc;
  final time;

  const BoxTile(
      {super.key,
      this.icon,
      this.time,
      this.firstTitle,
      this.secondTitle,
      this.firstDesc,
      this.secondDesc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, AppValues.basePadding, 20, 0).r,
      child: Container(
        decoration: glassBoxDecorationStyle,
        height: AppValues.height_200 * 0.4.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon ?? Icons.sunny_snowing,
                  size: AppValues.iconSize_50.r,
                ),
                _infoColumn(firstTitle, firstDesc),
                _infoColumn(secondTitle, secondDesc)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _infoColumn(title, desc) => Builder(builder: (context) {
        return Column(
          children: [
            Text(
              title ?? '',
              style: context.appThemeText.bodyLarge,
            ),
            Text(
              desc ?? '',
              style: context.appThemeText.titleLarge,
            )
          ],
        );
      });
}
