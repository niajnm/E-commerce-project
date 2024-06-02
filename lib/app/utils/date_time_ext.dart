import 'package:weather_assesment/app/base_app/base_app.dart';
import 'package:weather_assesment/app/utils/date_parser.dart';
import 'package:weather_assesment/app/utils/int_ext.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:intl/intl.dart';

extension DateTimeExtenstions on DateTime {
  double toDay() {
    return hour.hoursToDay() + minute.minutesToDay() + second.secondsToDay();
  }

  DateTime roundUpMinute() {
    int updatedMinute = second == 0 ? minute : (minute + 1);

    return DateTime(year, month, day, hour, updatedMinute);
  }

  /// When second is 0, to make 1 minute gap between roundUp and
  /// roundDown, here we're subtracting 1 minute

  DateTime roundDownMinute() {
    int updatedMinute = second == 0 ? minute - 1 : minute;

    return DateTime(year, month, day, hour, updatedMinute);
  }

  DateTime removeSeconds() {
    return DateTime(year, month, day, hour, minute);
  }

  DateTime addSeconds(int seconds) {
    return add(Duration(seconds: seconds));
  }

  DateTime addMinutes(int minutes) {
    return add(Duration(minutes: minutes));
  }

  DateTime addHours(int hours) {
    return add(Duration(hours: hours));
  }

  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  DateTime subtractSeconds(int seconds) {
    return subtract(Duration(seconds: seconds));
  }

  DateTime subtractMinutes(int minutes) {
    return subtract(Duration(minutes: minutes));
  }

  DateTime subtractDays(int days) {
    return subtract(Duration(days: days));
  }

  bool isOnSameDay(DateTime dateTimeToCompareWith) {
    return year == dateTimeToCompareWith.year &&
        month == dateTimeToCompareWith.month &&
        day == dateTimeToCompareWith.day;
  }

  int get totalDaysOfMonth {
    DateTime firstDayOfThisMonth = DateTime(year, month, 1);
    DateTime firstDayOfNextMonth = DateTime(year, month + 1, 1);
    int totalDays = firstDayOfNextMonth.difference(firstDayOfThisMonth).inDays;

    return totalDays;
  }

  int get dayOfWeek {
    int additionalDay = weekday + 2;
    int actualDay = additionalDay % DateTime.daysPerWeek;

    return actualDay == 0 ? DateTime.daysPerWeek : actualDay;
  }

  List<DateTime> get daysOfMonth {
    int totalDays = totalDaysOfMonth;
    List<DateTime> days = [];

    for (int dayCounter = 1; dayCounter <= totalDays; dayCounter++) {
      days.add(DateTime(year, month, dayCounter));
    }

    return days;
  }

  List<DateTime> previousDaysTill(int range) {
    List<DateTime> days = [];

    for (int dayCounter = range * -1; dayCounter < 0; dayCounter++) {
      days.add(add(Duration(days: dayCounter)));
    }

    return days;
  }

  List<DateTime> nextDaysTill(int range) {
    List<DateTime> days = [];

    for (int dayCounter = 1; dayCounter <= range; dayCounter++) {
      days.add(add(Duration(days: dayCounter)));
    }

    return days;
  }

  // TODO:
  String get localizedDay {
    AppLocalizations appLocalization =
        AppLocalizations.of(navigatorKey.currentContext!)!;

    return DateFormat("dd", appLocalization.localeName).format(this);
  }

  String get localizedWeekDay {
    AppLocalizations appLocalization =
        AppLocalizations.of(navigatorKey.currentContext!)!;

    switch (weekday) {
      case DateTime.saturday:
        return appLocalization.weekDaySaturday;
      case DateTime.sunday:
        return appLocalization.weekDaySunday;
      case DateTime.monday:
        return appLocalization.weekDayMonday;
      case DateTime.tuesday:
        return appLocalization.weekDayTuesday;
      case DateTime.wednesday:
        return appLocalization.weekDayWednesday;
      case DateTime.thursday:
        return appLocalization.weekDayThursday;
      case DateTime.friday:
        return appLocalization.weekDayFriday;
      default:
        return appLocalization.weekDayFriday;
    }
  }

  String get localizedMonth {
    AppLocalizations appLocalization =
        AppLocalizations.of(navigatorKey.currentContext!)!;

    return DateFormat(DateParser.fullMonth, appLocalization.localeName)
        .format(this);
  }

  String get localizedYear {
    AppLocalizations appLocalization =
        AppLocalizations.of(navigatorKey.currentContext!)!;

    return DateFormat(DateParser.fullYear, appLocalization.localeName)
        .format(this);
  }

  String get dateString {
    AppLocalizations appLocalization =
        AppLocalizations.of(navigatorKey.currentContext!)!;

    return DateFormat(DateParser.defaultDateFormat, appLocalization.localeName)
        .format(this);
  }

  bool isBetweenTwoDates(DateTime firstDate, DateTime secondDate) {
    return (isAfter(firstDate) && isBefore(secondDate)) ||
        isOnSameDay(firstDate) ||
        isOnSameDay(secondDate);
  }

  DateTime adjustTimeZone(int currentTimeZone) {
    int timeZoneToBeAdjusted = timeZoneOffset.inMinutes;
    int minutesToAdd = timeZoneToBeAdjusted - currentTimeZone;

    return add(Duration(minutes: minutesToAdd));
  }
}
