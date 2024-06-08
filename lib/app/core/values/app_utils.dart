import 'package:e_commerce/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppUtils {
  static void showToast(BuildContext context, String message,
      {int sec = 1,
      bgColor = AppColors.almostBlack,
      textColor = AppColors.colorWhite}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: bgColor,
        content: Text(
          message,
          // style: bodyText1(textColor),
        ),
        duration: Duration(seconds: sec),
      ),
    );
  }

  static void showAlertDialog(
      BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void snackbarShowWithActionBtn(context) {
    final snackBar = SnackBar(
      content: const Text('Added as Favorited'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static smallButton(
          {IconData? icon,
          title,
          double btnHeight = 32,
          backGroundColor = AppColors.accentRed,
          var fontNdIconColor,
          baseColor = AppColors.colorWhite,
          required Function onTap}) =>
      Padding(
        padding: const EdgeInsets.only(right: 5.0).r,
        child: InkWell(
            onTap: () {
              onTap();
            },
            child: Container(
              //width: 90,
              height: btnHeight,
              decoration: BoxDecoration(
                  color: backGroundColor,
                  border: Border.all(
                    color: baseColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(4).r)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8).r,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: icon == null ? false : true,
                      child: Icon(
                        icon,
                        size: 18,
                        color: baseColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0).r,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style:
                            //  hintText(
                            //   fontNdIconColor == null
                            //       ? baseColor
                            //       : fontNdIconColor,
                            // )

                            TextStyle(
                          color: fontNdIconColor == null
                              ? baseColor
                              : fontNdIconColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      );

  static double feedCalculation(
      {int totalQuantity = 0,
      double averageWeight = 0.0,
      double minAverageWeight = 0.0,
      double maxAverageWeight = 0.0,
      double minFeedRange = 0.0,
      double maxFeedRange = 0.0}) {
    double slope =
        (maxFeedRange - minFeedRange) / (maxAverageWeight - minAverageWeight);
    double value = slope * (averageWeight - minAverageWeight) + minFeedRange;
    double result = (value / 1000);
    return result * totalQuantity;
  }
}
