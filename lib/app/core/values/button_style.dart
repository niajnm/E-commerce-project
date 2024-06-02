import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'app_values.dart';

final primaryElevatedButtonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.symmetric(
    vertical: AppValues.buttonVerticalPadding.h,
    horizontal: AppValues.basePadding.w,
  ),
  elevation: 0,
  backgroundColor: AppColors.colorPrimary,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppValues.roundedButtonRadius.r),
  ),
);

final secondaryButtonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.symmetric(vertical: AppValues.buttonVerticalPadding.h),
  backgroundColor: AppColors.colorAccent,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppValues.roundedButtonRadius.r),
  ),
);

final cancelButtonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.symmetric(vertical: AppValues.buttonVerticalPadding.h),
  backgroundColor: AppColors.neutralSeparator,
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppValues.roundedButtonRadius.r),
  ),
);

ButtonStyle? continueElevatedButtonStyle(
        [double radius = AppValues.radius_zero]) =>
    ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColors.colorPrimary,
      disabledForegroundColor: AppColors.colorPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    );

const primaryButtonTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: AppColors.colorWhite,
);

TextStyle secondaryButtonTextStyle = TextStyle(
  fontSize: AppValues.fontSize_14.r,
  fontWeight: FontWeight.w700,
  color: AppColors.colorWhite,
);

const customizableButtonDefaultTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: AppColors.colorWhite,
);

const cancelButtonTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: AppColors.colorBlack,
);

const textButtonStyle = TextStyle(
  fontSize: 20,
  color: AppColors.colorPrimary,
  fontWeight: FontWeight.w500,
);

const iconButtonLabelStyle = TextStyle(
  fontSize: 20,
  color: AppColors.colorPrimary,
  fontWeight: FontWeight.w500,
);

const radioButtonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textColorPrimary);

final TextStyle alertDialogTextButtonStyle =
    textButtonStyle.copyWith(fontSize: AppValues.fontSize_16.r);
