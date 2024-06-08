import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_commerce/app/core/values/app_colors.dart';
import 'package:e_commerce/app/core/values/app_fonts.dart';
import 'package:e_commerce/app/core/values/app_language.dart';
import 'package:e_commerce/app/core/values/style_sheet.dart';
import 'package:e_commerce/app/core/values/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static ThemeData getDarkTheme(String appLanguage) {
    return ThemeData(
      primaryColor: const Color(0xFFFF6464), // Based on the Sign Up button
      hintColor:
          const Color(0xFFE1E1E1), // Based on text colors used in the app
      scaffoldBackgroundColor:
          const Color(0xFF0D1C2E), // Background color for the app

      // Text theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
          color: Color(0xFFB3B3B3),
        ),
        titleLarge: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      // Color scheme
      colorScheme: const ColorScheme(
        primary: Color(0xFF1E1E1E),
        secondary: Color(0xFFFF6464),
        surface: Color(0xFF1E1E1E),
        background: Color(0xFF0D1C2E),
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.white,
        brightness: Brightness.dark,
      ),

      // Input decoration theme
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Color(0xFF1E1E1E),
        contentPadding: EdgeInsets.all(16.0),
      ),

      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(const Color(0xFFFF6464)),
      ),

      // Button theme
      buttonTheme: ButtonThemeData(
        buttonColor: const Color(0xFFFF6464),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textTheme: ButtonTextTheme.accent,
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6464),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      // Icon theme
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),

      // AppBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      // Bottom Navigation Bar theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF1E1E1E),
        selectedItemColor: Color(0xFFFF6464),
        unselectedItemColor: Color(0xFF6D7278),
      ),

      // Floating Action Button theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFFF6464),
      ),

      cardTheme: CardTheme(
        color: const Color.fromARGB(255, 68, 65, 65),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(8.0),
      ),
    );
  }

  static ThemeData getLightTheme(String appLanguage) {
    return ThemeData(
      primaryColor: const Color(0xFFFF6464), // Based on the Sign Up button
      hintColor: const Color.fromARGB(
          255, 70, 73, 77), // Based on text colors used in the app
      scaffoldBackgroundColor:
          const Color(0xFFF8F8F8), // Background color for the app
      bottomAppBarTheme: const BottomAppBarTheme(
          surfaceTintColor: Colors.white,
          color: Colors.white, // Background color of the BottomAppBar
          elevation: 8.0, // Elevation of the BottomAppBar
          shape: CircularNotchedRectangle(),
          shadowColor: Colors.grey // Shape of the BottomAppBar
          ),

      // Text theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
        ),
        titleLarge: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Color scheme
      // colorScheme: const ColorScheme(
      //   primary: Color.fromARGB(255, 223, 203, 203),
      //   secondary: Color(0xFF0D1C2E),
      //   surface: Colors.white,
      //   background: Color.fromARGB(255, 143, 139, 139),
      //   error: Colors.red,
      //   onPrimary: Color.fromARGB(255, 39, 20, 20),
      //   onSecondary: Colors.white,
      //   onSurface: Color(0xFF0D1C2E),
      //   onBackground: Color(0xFF0D1C2E),
      //   onError: Colors.white,
      //   brightness: Brightness.light,
      // ),

      // Input decoration theme
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Color.fromARGB(255, 54, 51, 51),
        contentPadding: EdgeInsets.all(
          16.0,
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        //   borderSide: BorderSide.none
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        //   borderSide: const BorderSide(color: Color(0xFFE1E1E1)),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        //   borderSide: const BorderSide(color: Color(0xFFFF6464)),
        // ),
      ),

      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(const Color(0xFFFF6464)),
      ),

      // Button theme
      buttonTheme: ButtonThemeData(
        buttonColor: const Color(0xFFFF6464),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textTheme: ButtonTextTheme.normal,
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6464),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      // Icon theme
      iconTheme: const IconThemeData(
        color: Color(0xFF0D1C2E),
      ),

      // AppBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 119, 115, 115),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF0D1C2E)),
      ),

      // Bottom Navigation Bar theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFFFF6464),
        unselectedItemColor: Color(0xFF6D7278),
      ),

      // Floating Action Button theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFFF6464),
      ),

      // Card theme
      cardTheme: CardTheme(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(8.0),
      ),
    );
  }

  static String _getFont(String language) {
    return language == AppLanguage.bn.name ? AppFonts.bangla : AppFonts.english;
  }

  static ThemeData lightThemeFlex(String appLanguage) => FlexThemeData.light(
        scheme: FlexScheme.mandyRed,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 33,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          splashType: FlexSplashType.instantSplash,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
          navigationRailLabelType: NavigationRailLabelType.none,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );

  static ThemeData darkThemeFlex(String appLanguage) => FlexThemeData.dark(
        scheme: FlexScheme.barossa,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.background,
        bottomAppBarElevation: 2.0,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 40,
          blendTextTheme: true,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          thickBorderWidth: 2.0,
          elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
          elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
          outlinedButtonOutlineSchemeColor: SchemeColor.primary,
          toggleButtonsBorderSchemeColor: SchemeColor.primary,
          segmentedButtonSchemeColor: SchemeColor.primary,
          segmentedButtonBorderSchemeColor: SchemeColor.primary,
          unselectedToggleIsColored: true,
          sliderValueTinted: true,
          inputDecoratorSchemeColor: SchemeColor.primary,
          inputDecoratorBackgroundAlpha: 22,
          inputDecoratorRadius: 10.0,
          chipRadius: 10.0,
          popupMenuRadius: 6.0,
          popupMenuElevation: 6.0,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
          drawerWidth: 280.0,
          drawerIndicatorSchemeColor: SchemeColor.primary,
          bottomNavigationBarMutedUnselectedLabel: false,
          bottomNavigationBarMutedUnselectedIcon: false,
          menuRadius: 6.0,
          menuElevation: 6.0,
          menuBarRadius: 0.0,
          menuBarElevation: 1.0,
          navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
          navigationBarMutedUnselectedLabel: false,
          navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
          navigationBarMutedUnselectedIcon: false,
          navigationBarIndicatorSchemeColor: SchemeColor.primary,
          navigationBarIndicatorOpacity: 1.00,
          navigationBarElevation: 2.0,
          navigationBarHeight: 70.0,
          navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
          navigationRailMutedUnselectedLabel: false,
          navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
          navigationRailMutedUnselectedIcon: false,
          navigationRailIndicatorSchemeColor: SchemeColor.primary,
          navigationRailIndicatorOpacity: 1.00,
        ),
        keyColors: const FlexKeyColors(
          useTertiary: true,
          keepPrimary: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.notoSans().fontFamily,
      );
}
