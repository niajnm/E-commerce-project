import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';

import 'package:weather_assesment/app/core/values/app_values.dart';

// ignore: must_be_immutable
class FrostedGlassBox extends StatelessWidget {
  final dotEnable;
  final theWidth;
  final theHeight;
  Widget theChild;
  FrostedGlassBox(
      {Key? key,
      required this.dotEnable,
      required this.theWidth,
      required this.theHeight,
      required this.theChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                width: theWidth,
                height: theHeight,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    _filterEffect(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.13), width: 2.0),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              //begin color
                              Colors.white.withOpacity(0.5),
                              //end color
                              Colors.white.withOpacity(0.02),
                            ]),
                      ),
                    ),
                    Center(child: theChild),
                  ],
                ),
              ),
            ),
            dotEnable ? dotWhite() : const SizedBox.shrink()
          ],
        ),
      ],
    );
  }

  Widget dotWhite() => Padding(
        padding: const EdgeInsets.all(AppValues.halfPadding).r,
        child: Card(
          child: CircleAvatar(
            radius: 8.r,
            backgroundColor: Colors.white,
          ),
        ),
      );

  BackdropFilter _filterEffect() => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4.0,
          sigmaY: 4.0,
        ),
        child: Container(),
      );
}
