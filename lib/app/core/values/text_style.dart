import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'app_colors.dart';
import 'app_values.dart';

final TextStyle errorTextStyle = TextStyle(
  fontSize: AppValues.fontSize_12.r,
  fontWeight: FontWeight.w400,
  color: AppColors.errorColor,
);

final TextStyle warningTextStyle = TextStyle(
  fontSize: AppValues.fontSize_12.r,
  fontWeight: FontWeight.w500,
  color: AppColors.primaryGreen05,
);

final TextStyle dataTitleLabelTextStyle = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  fontWeight: FontWeight.w500,
  color: AppColors.dataTitleLabelColor,
);

final TextStyle cardSubtitleStyle = TextStyle(
  fontSize: AppValues.fontSize_14.r,
  fontWeight: FontWeight.w500,
  height: 1.2,
  color: AppColors.textColorGreyLight,
);

final TextStyle titleStyle = TextStyle(
  fontSize: AppValues.fontSize_18.r,
  fontWeight: FontWeight.w500,
  height: 1.34,
);

final TextStyle inputFieldLabelStyle = TextStyle(
  fontSize: AppValues.fontSize_18.r,
  fontWeight: FontWeight.w500,
  height: 1.34,
  color: AppColors.textColorPrimary,
);

final TextStyle cardSmallTagStyle = TextStyle(
  fontSize: AppValues.fontSize_14.r,
  fontWeight: FontWeight.w500,
  height: 1.2,
  color: AppColors.textColorGreyDark,
);

final TextStyle pageTitleStyle = TextStyle(
  fontSize: AppValues.fontSize_18.r,
  fontWeight: FontWeight.w600,
  height: 1.15,
  color: AppColors.primaryGreen05,
);

final TextStyle pageTitleStyleDark = TextStyle(
  fontSize: AppValues.fontSize_18.r,
  fontWeight: FontWeight.w600,
  height: 1.15,
  color: AppColors.textColorWhite,
);

final pageTitleBlackStyle = pageTitleStyle.copyWith(
  color: AppColors.textColorPrimary,
);

final TextStyle appBarActionTextStyle = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  fontWeight: FontWeight.w600,
  color: AppColors.colorPrimary,
);

final TextStyle pageTitleWhiteStyle = TextStyle(
  fontSize: AppValues.fontSize_28.r,
  fontWeight: FontWeight.w600,
  height: 1.15,
  color: AppColors.colorWhite,
);

final TextStyle extraBigTitleStyle = TextStyle(
  fontSize: AppValues.fontSize_40.r,
  fontWeight: FontWeight.w600,
  height: 1.12,
);

final extraBigTitleCyanStyle = extraBigTitleStyle.copyWith(
  color: AppColors.textColorCyan,
);

final TextStyle bigTitleStyle = TextStyle(
  fontSize: AppValues.fontSize_28.r,
  fontWeight: FontWeight.w700,
  height: 1.15,
);

final TextStyle mediumTitleStyle = TextStyle(
  fontSize: AppValues.fontSize_24.r,
  fontWeight: FontWeight.w500,
  height: 1.15,
);

final TextStyle descriptionTextStyle = TextStyle(
  fontSize: AppValues.fontSize_16.r,
);

final bigTitleCyanStyle = bigTitleStyle.copyWith(
  color: AppColors.textColorCyan,
);

final TextStyle bigTitleWhiteStyle = TextStyle(
  fontSize: AppValues.fontSize_28.r,
  fontWeight: FontWeight.w700,
  height: 1.15,
  color: Colors.white,
);

final TextStyle boldTitleStyle = TextStyle(
  fontSize: AppValues.fontSize_18.r,
  fontWeight: FontWeight.w700,
  height: 1.34,
);

final boldTitleWhiteStyle = boldTitleStyle.copyWith(
  color: AppColors.textColorWhite,
);

final boldTitleCyanStyle = boldTitleStyle.copyWith(
  color: AppColors.textColorCyan,
);

final boldTitleSecondaryColorStyle = boldTitleStyle.copyWith(
  color: AppColors.textColorSecondary,
);

final boldTitlePrimaryColorStyle = boldTitleStyle.copyWith(
  color: AppColors.colorPrimary,
);

final boldTitlePrimaryGreenColorStyle = boldTitleStyle.copyWith(
  color: AppColors.primaryGreen05,
);

final TextStyle onBoardTitleStyle = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  color: AppColors.primaryGreen05,
  fontWeight: FontWeight.w500,
);

final deselectedLanguageTitleStyle = onBoardTitleStyle.copyWith(
  fontWeight: FontWeight.w400,
);

final TextStyle selectedLanguageTextStyle = TextStyle(
  color: AppColors.primaryGreen04,
  fontSize: AppValues.fontSize_16.r,
);

final TextStyle deselectedLanguageTextStyle = TextStyle(
  color: AppColors.textColorPrimary,
  fontSize: AppValues.fontSize_16.r,
);

final inputFieldLabelAsteriskStyle = inputFieldLabelStyle.copyWith(
  color: AppColors.accentRed,
);

final TextStyle inputFieldHintTextStyle = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  fontWeight: FontWeight.w700,
  color: AppColors.inputFieldHintTextColor,
);

final TextStyle inputFieldTextStyle = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  fontWeight: FontWeight.w700,
  color: AppColors.primaryGreen05,
);

final TextStyle inputFieldMessageTextStyle = TextStyle(
  fontSize: AppValues.fontSize_14.r,
  fontWeight: FontWeight.w400,
  color: AppColors.primaryGreen05,
);

final inputFieldSuccessMessageTextStyle = inputFieldMessageTextStyle.copyWith(
  color: AppColors.inputFieldSuccessMessageTextColor,
);

final inputFieldErrorMessageTextStyle = inputFieldMessageTextStyle.copyWith(
  color: AppColors.inputFieldErrorMessageTextColor,
);

final inputFieldWarningMessageTextStyle = inputFieldMessageTextStyle.copyWith(
  color: AppColors.inputFieldWarningMessageTextColor,
);

final inputFieldInfoMessageTextStyle = inputFieldMessageTextStyle.copyWith(
  color: AppColors.inputFieldInfoMessageTextColor,
);

final inputFieldDescriptionTextStyle = inputFieldMessageTextStyle.copyWith(
  color: AppColors.inputFieldDescriptionTextColor,
);

final hintTextStyle = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  color: AppColors.neutralLightGray,
);

final TextStyle twoLinesTextItemSubtitleTextStyle = TextStyle(
  fontSize: AppValues.fontSize_12.r,
  color: AppColors.neutralLightGray,
);

final TextStyle topBannerTitleStyle = TextStyle(
  fontSize: AppValues.fontSize_14.r,
  fontWeight: FontWeight.w400,
);

final TextStyle topBannerMessageStyle = TextStyle(
  fontSize: AppValues.fontSize_12.r,
  fontWeight: FontWeight.w400,
);

final TextStyle subsectionTitleTextStyle = TextStyle(
  fontSize: AppValues.fontSize_14.r,
  color: AppColors.colorAccent,
  fontWeight: FontWeight.bold,
);

final TextStyle hcWeekDayTextStyle = TextStyle(
  fontSize: AppValues.fontSize_12.r,
  color: AppColors.neutralGray,
  fontWeight: FontWeight.w700,
);

final TextStyle hcDayTextStyle = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  color: AppColors.colorBlack,
  fontWeight: FontWeight.w700,
);

final TextStyle hcCurrentWeekDayTextStyle = hcWeekDayTextStyle.copyWith(
  color: AppColors.primaryGreen03,
);

final TextStyle hcCurrentDayTextStyle = hcDayTextStyle.copyWith(
  color: AppColors.primaryGreen03,
);

final TextStyle hcSelectedWeekDayTextStyle = hcWeekDayTextStyle.copyWith(
  color: AppColors.colorWhite,
);

final TextStyle hcSelectedDayTextStyle = hcDayTextStyle.copyWith(
  color: AppColors.colorWhite,
);

final TextStyle datePickerSetButtonTextStyle = TextStyle(
  fontSize: AppValues.fontSize_14.r,
  fontWeight: FontWeight.w700,
  color: AppColors.colorWhite,
  height: 1.34,
);

final TextStyle datePickerDateTextStyle = TextStyle(
  fontSize: AppValues.fontSize_14.r,
  fontWeight: FontWeight.w400,
  color: AppColors.almostBlack,
  height: 1.34,
);

final TextStyle datePickerWeekDayTextStyle = datePickerDateTextStyle.copyWith(
  color: AppColors.almostBlack,
  fontWeight: FontWeight.w700,
);

final TextStyle datePickerCurrentDateTextStyle =
    datePickerDateTextStyle.copyWith(
  color: AppColors.primaryGreen04,
);

final TextStyle datePickerSelectedDateTextStyle =
    datePickerDateTextStyle.copyWith(
  color: AppColors.colorWhite,
);

final TextStyle datePickerMonthTextStyle = datePickerDateTextStyle.copyWith(
  color: AppColors.primaryGreen04,
  fontWeight: FontWeight.w700,
);

TextStyle bodySmallTextStyle = TextStyle(
  fontSize: AppValues.fontSize_12.r,
  fontWeight: FontWeight.w400,
  color: AppColors.almostBlack,
);

TextStyle bodySmallTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_12.r,
  fontWeight: FontWeight.w400,
  color: AppColors.neutralBackground,
);

TextStyle bodyMediumTextStyle = TextStyle(
  fontSize: AppValues.fontSize_14.r,
  fontWeight: FontWeight.w400,
  color: AppColors.almostBlack,
);

TextStyle bodyMediumTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_14.r,
  fontWeight: FontWeight.w400,
  color: AppColors.neutralBackground,
);

TextStyle bodyLargeTextStyle = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  fontWeight: FontWeight.w400,
  color: AppColors.almostBlack,
);

TextStyle bodyLargeTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  fontWeight: FontWeight.w400,
  color: AppColors.neutralBackground,
);

TextStyle displaySmallTextStyle = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  fontWeight: FontWeight.w600,
  color: AppColors.primaryGreen05,
);

TextStyle displaySmallTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  fontWeight: FontWeight.w600,
  color: AppColors.neutralBackground,
);

TextStyle displayMediumTextStyle = TextStyle(
  fontSize: AppValues.fontSize_20.r,
  fontWeight: FontWeight.w600,
  color: AppColors.colorBlack,
);

TextStyle displayMediumTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_20.r,
  fontWeight: FontWeight.w600,
  color: AppColors.neutralBackground,
);

TextStyle displayLargeTextStyle = TextStyle(
    fontSize: AppValues.fontSize_24.r,
    fontWeight: FontWeight.w600,
    color: AppColors.colorWhite);

TextStyle displayLargeTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_24.r,
  fontWeight: FontWeight.w600,
  color: AppColors.neutralBackground,
);

TextStyle headlineSmallTextStyle = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  fontWeight: FontWeight.w400,
  color: AppColors.primaryGreen05,
);

TextStyle headlineSmallTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  fontWeight: FontWeight.w400,
  color: AppColors.neutralBackground,
);

TextStyle headlineMediumTextStyle = TextStyle(
  fontSize: AppValues.fontSize_20.r,
  fontWeight: FontWeight.w400,
  color: AppColors.primaryGreen05,
);

TextStyle headlineMediumTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_20.r,
  fontWeight: FontWeight.w400,
  color: AppColors.neutralBackground,
);

TextStyle headlineLargeTextStyle = TextStyle(
  fontSize: AppValues.fontSize_24.r,
  fontWeight: FontWeight.w400,
  color: AppColors.colorWhite,
);

TextStyle headlineLargeTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_24.r,
  fontWeight: FontWeight.w400,
  color: AppColors.neutralBackground,
);

TextStyle titleSmallTextStyle = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  fontWeight: FontWeight.w400,
  color: AppColors.primaryGreen04,
);

TextStyle titleSmallTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  fontWeight: FontWeight.w400,
  color: AppColors.primaryGreen04,
);

TextStyle titleMediumTextStyle = TextStyle(
  fontSize: AppValues.fontSize_20.r,
  fontWeight: FontWeight.w400,
  color: AppColors.primaryGreen04,
);

TextStyle titleMediumTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_20.r,
  fontWeight: FontWeight.w400,
  color: AppColors.primaryGreen04,
);

TextStyle titleLargeTextStyle = TextStyle(
  fontSize: AppValues.fontSize_24.r,
  fontWeight: FontWeight.w400,
  color: AppColors.primaryGreen04,
);

TextStyle titleLargeTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_24.r,
  fontWeight: FontWeight.w400,
  color: AppColors.primaryGreen04,
);

TextStyle labelSmallTextStyle = TextStyle(
  fontSize: AppValues.fontSize_12.r,
  fontWeight: FontWeight.w700,
  color: AppColors.almostBlack,
);

TextStyle labelSmallTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_12.r,
  fontWeight: FontWeight.w700,
  color: AppColors.neutralBackground,
);

TextStyle labelMediumTextStyle = TextStyle(
  fontSize: AppValues.fontSize_14.r,
  fontWeight: FontWeight.w700,
  color: AppColors.almostBlack,
);

TextStyle labelMediumTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_14.r,
  fontWeight: FontWeight.w700,
  color: AppColors.neutralBackground,
);

TextStyle labelLargeTextStyle = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  fontWeight: FontWeight.w700,
  color: AppColors.almostBlack,
);

TextStyle labelLargeTextStyleDark = TextStyle(
  fontSize: AppValues.fontSize_16.r,
  fontWeight: FontWeight.w700,
  color: AppColors.neutralBackground,
);

TextStyle notificationReferenceIndexTextStyle = TextStyle(
  fontSize: AppValues.fontSize_14.r,
  fontWeight: FontWeight.w400,
  color: AppColors.primaryGreen03,
);
TextStyle notificationReferenceTitleTextStyle = TextStyle(
  fontSize: AppValues.fontSize_14.r,
  fontWeight: FontWeight.w400,
  color: AppColors.primaryGreen03,
  decoration: TextDecoration.underline,
);
