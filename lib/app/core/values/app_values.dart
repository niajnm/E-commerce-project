import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppValues {
  static const double activeIndicatorSize = 8;

  static const double appBarIconSize = 24;
  static const double barrierColorOpacity = 0.4;
  static const double buttonVerticalPadding = 2;
  static const double circularImageDefaultBorderSize = 0;
  static const double circularImageDefaultElevation = 0;
  static const double circularImageDefaultSize = 90;
  static const double circularImageSize_30 = 30;
  static const double citySelectionZoom = 12.0;
  static const double collapsedAppBarSize = 70.0;
  static const double collectionThumbnailDefaultSize = 150;
  static const double continueButtonHeight = 50;
  static const double countDownTimerWidth = 10.0;
  static const double countrySelectionZoom = 5.0;
  static const double customAppBarSize = 144.0;
  static const double datePickerHeightOnIos = 270;
  static const double defaultScreenHeight = 640;
  static const double defaultScreenWidth = 360;
  static const double defaultViewPortFraction = 0.9;
  static const double defaultZoom = 15.0;

  static const double dividerWeight = 1.4;
  static const double elevation = 16;
  static const double horizontalCalendarScrollAlignment = 0.43;
  static const double smallElevation = 8;
  static const double stackedImageDefaultBorderSize = 4;
  static const double stackedImageDefaultSize = 30;
  static const double stackedImageDefaultSpaceFactor = 0.4;
  static const double topBannerButtonHeight = 30;
  static const double warningMessageBoxBorderWidth = 0.4;
  static const double twoLinesTextItemContentPadding = 18.0;
  static const double twoLinesTextItemHeight = 52.0;
  static const double unseenNotificationBackgroundColorOpacity = 0.1;
  static const int datePickerDropdownHeight = 42;
  static const int datePickerEndYear = 2050;
  static const int datePickerStartYear = 2015;
  static const int defaultAnimationDuration = 300;
  static const int defaultDebounceTimeInMilliSeconds = 1000;
  static const int defaultPageNumber = 1;
  static const int defaultPageSize = 10;
  static const int defaultThrottleTimeInMilliSeconds = 500;
  static const int dropdownItemHeight = 25;
  static const int loggerErrorMethodCount = 8;
  static const int loggerLineLength = 120;
  static const int loggerMethodCount = 2;
  static const int maxCharacterCountOfQuote = 108;
  static const int splashScreenDuration = 1;
  static const int cautionTimeDefaultValue = 3;
  static const int donationBannerEligibleDayAfterInstall = 3;
  static const int donationBannerEligibleDay = 4;
  static const double notificationDetailsImageHeight = 180;
  static const int sliderButtonAnimationDuration = 1;
  static const int sliderButtonAnimationTime = 5;
  static const int sliderButtonVisibilityTime = 4;
  static const double compassAnswerHeight = 5;
  static const double compassAnswerWidth = 15;
  static const double qiblaIconSize = 24;
  static const double compassCardHeight = 350;
  static const double compassCardWidth = 300;
  static const double compassCentralDesignHeight = 180;
  static const double compassWidth = 200;
  static const double compassWidthWithBorder = 250;
  static const double compassNeedleWidth = 150;
  static const double compassBackgroundImageWidth = 180;
  static const double tasbeehBackgroundImageWidth = 140;
  static const int doubleBackToExitTimeLimit = 2;
  static const double emoticonDefaultSize = 22;
  static const double extraLargeSpacing = 96;
  static const double extraSmallElevation = 4;

  static const double fullViewPort = 1;

  // FIXED HEIGHT VALUES
  static const double height_16 = 16;
  static const double height_25 = 25;
  static const double height_42 = 42;
  static const double height_48 = 48;
  static const double height_50 = 50;
  static const double height_52 = 52;
  static const double height_150 = 150;
  static const double height_200 = 200;
  static const double height_300 = 300;

  static const double horizontalCalendarHeight = 85;

  // FIXED DEGREE VALUES
  static const double degree_zero = 0;
  static const double degree_45 = 45;
  static const double degree_90 = 90;
  static const double degree_180 = 180;
  static const double degree_360 = 360;

  // ICON SIZE VALUES
  static const double iconSizeLauncher = 200;
  static const double iconSize_5 = 5;
  static const double iconSize_10 = 10;
  static const double iconSize_14 = 14;
  static const double iconSize_18 = 18;
  static const double iconSize_20 = 20;
  static const double iconSize_22 = 22;
  static const double iconSize_24 = 24;
  static const double iconSize_28 = 28;
  static const double iconSize_30 = 30;
  static const double iconSize_32 = 32;
  static const double iconSize_36 = 36;
  static const double iconSize_40 = 40;
  static const double iconSize_50 = 50;
  static const double iconSize_60 = 60;
  static const double iconSize_75 = 75;
  static const double iconSmallerSize = 12;
  static const double iconSmallSize = 16;

  static const double iconDefaultSize = 24;
  static const double iconExtraLargerSize = 96;
  static const double iconLargeSize = 36;

  static const double inactiveIndicatorSize = 10;
  static const double indicatorDefaultSize = 8;
  static const double indicatorShadowBlurRadius = 1;
  static const double indicatorShadowSpreadRadius = 0;
  static const double initialLat = 23.732576;
  static const double initialLon = 90.384973;
  static const double inputFieldBorderWidth = 2;
  static const double inputFieldCornerRadius = 8;
  static const double largeElevation = 24;

  static const double listBottomEmptySpace = 200;

  // MARGIN VALUES
  static const double marginBelowVerticalLine = 64;
  static const double margin_10 = 10;
  static const double margin_12 = 12;
  static const double margin_16 = 16;
  static const double margin_18 = 18;
  static const double margin_26 = 26;
  static const double margin_2 = 2;
  static const double margin_20 = 20;
  static const double margin_30 = 30;
  static const double margin_32 = 32;
  static const double margin_3 = 4;
  static const double margin_4 = 4;
  static const double margin_40 = 40;
  static const double margin_6 = 6;
  static const double margin_8 = 8;
  static const double margin_zero = 0;

  // GENERIC MARGIN
  static const double baseMargin = 16;
  static const double largeMargin = baseMargin * 1.25;
  static const double extraLargeMargin = largeMargin * 1.25;
  static const double smallMargin = baseMargin * 0.875;
  static const double extraSmallMargin = smallMargin * 0.875;

  static const double maxButtonHeight = 38;
  static const double maxButtonWidth = 496;
  static const double momentSmallThumbnailDefaultSize = 32;
  static const double momentThumbnailDefaultSize = 80;
  static const double notificationItemImageHeight = 40;
  static const double notificationItemImageWidth = 75;
  static const double onBoardingImageHeight = 270.0;
  static const double opacityDisabledField = 0.3;
  static const double opacityEnabledField = 1.0;

  // PADDING VAULES
  static const double padding_zero = 0;
  static const double padding_10 = 10;
  static const double padding_12 = 12;
  static const double padding_14 = 14;
  static const double padding_15 = 15;
  static const double padding_16 = 16;
  static const double padding_2 = 2;
  static const double padding_20 = 20;
  static const double padding_24 = 24;
  static const double padding_30 = 30;
  static const double padding_3 = 3;
  static const double padding_4 = 4;
  static const double padding_5 = 5;
  static const double padding_8 = 8;

  // GENERIC PADDING
  static const double basePadding = 16.0;
  static const double halfPadding = basePadding / 2;
  static const double genericPadding = basePadding;
  static const double largerPadding = basePadding * 1.25;
  static const double extraLargePadding = largerPadding * 1.25;
  static const double smallPadding = basePadding * 0.875;
  static const double extraSmallPadding = smallPadding * 0.86;

  // FIXED RADIUS VALUES
  static const double radius_zero = 0;
  static const double radius = 16;
  static const double radius_5 = 5;
  static const double radius_30 = 30;
  static const double radius_10 = 10;
  static const double radius_12 = 12;
  static const double radius_6 = 6;
  static const double radius_8 = 8;
  static const double smallRadius = 8;
  static const double appbarActionRippleRadius = 50;
  static const double extraLargeRadius = 36;
  static const double radius_24 = 24;

  static const double saomTimerProgressBarIconRadius = 80;
  static const double saomTimerProgressBarRadius = 46;
  static const double roundedButtonRadius = 4;

  // FIXED FONT VALUES
  static double displayFontRatio = 2;
  static const double fontSize_10 = 10;
  static const double fontSize_12 = 12;
  static const double fontSize_14 = 14;
  static const double fontSize_15 = 15;
  static const double fontSize_16 = 16;
  static const double fontSize_18 = 18;
  static const double fontSize_19 = 19;
  static const double fontSize_20 = 20;
  static const double fontSize_21 = 21;
  static const double fontSize_24 = 24;
  static const double fontSize_25 = 25;
  static const double fontSize_26 = 26;
  static const double fontSize_27 = 27;
  static const double fontSize_28 = 28;
  static const double fontSize_30 = 30;
  static const double fontSize_31 = 31;
  static const double fontSize_32 = 32;
  static const double fontSize_40 = 40;
  static const double fontSize_48 = 48;
  static const double fontSize_80 = 80;

  // GENERIC FONT
  static double baseFontSize = 16.0.sp;
  static double heading1FontRatio = heading2FontRatio * 1.125;
  static double heading2FontRatio = heading3FontRatio * 1.125;
  static double heading3FontRatio = heading4FontRatio * 1.125;
  static double heading4FontRatio = heading5FontRatio * 1.125;
  static double heading5FontRatio = heading6FontRatio * 1.125;
  static double heading6FontRatio = baseFontSize;
  static double bodyFont1 = baseFontSize;
  static double bodyFont2 = 0.85 * baseFontSize;
  static double bodyFont3 = baseFontSize * 0.68;
  static double captionFont = 0.555 * baseFontSize;
  static double subTitleFont = 0.386 * baseFontSize;

  static int phoneMaxLength = 11;

  static Duration animatedTransitionTime = const Duration(milliseconds: 500);

  static Widget sizedBoxShrink = const SizedBox.shrink();
}
