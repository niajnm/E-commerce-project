import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppGradients {
  static const LinearGradient horizontalCalendarGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.primaryGreen02, AppColors.primaryGreen03],
  );

  static const LinearGradient datePickerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.primaryGreen04, AppColors.primaryGreen03],
  );

  static LinearGradient glassGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        //begin color
        Colors.white.withOpacity(0.5),
        //end color
        Colors.white.withOpacity(0.02),
      ]);

  static LinearGradient bgGradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        //  background: linear-gradient(135deg, #97ABFF 0%, #123597 100%);

        //begin color
        Color(0xFF97ABFF),
        Color(0xff123597)
        //end color
        // Colors.white.withOpacity(0.01),
      ]);
}
