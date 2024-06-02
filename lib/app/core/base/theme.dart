import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum AppTheme { SYSTEM, DARK, LIGHT }

extension AppThemeExtension on AppTheme {
  String getThemeName(AppLocalizations appLocalization) {
    switch (this) {
      case AppTheme.DARK:
        {
          return appLocalization.themeDark;
        }
      case AppTheme.LIGHT:
        {
          return appLocalization.themeLight;
        }
      default:
        return appLocalization.themeSystem;
    }
  }

  static bool getIsDarkModeOn(AppTheme theme) {
    return theme == AppTheme.DARK;
  }
}
