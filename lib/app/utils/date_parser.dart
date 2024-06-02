import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

abstract class DateParser {
  static const String fullMonth = "MMMM";
  static const String fullYear = "yyyy";
  static const String defaultDateFormat = "dd MMMM, yyyy";
  static const String shortDateFormatWithDayName = "EEEE, dd MMMM";
  static const String defaultDateTimeFormat = "dd MMM yyyy 'at' HH:mma";
  static const String defaultTimeFormat = "HH:mm";
  static const String dateFormatWithFullMonthName = "dd MMMM yyyy";
  static const String dateFormatDayAndFullMonthName = "dd MMMM";
  static const String dateFormatShortDayName = "EE";
  static const String dateFormatDayName = "EEEE";
  static const String utcDateFormat = "yyyy-MM-dd";
  static const String utcDateTimeFormat = "yyyy-MM-dd HH:mm:ss.s";
  static const String fullDateWithDay = "EE, dd MMM yyyy";
  static const String dateWithoutYear = "EE, dd MMM";
  static const String offsetDateFormat = "yyyy-MM-dd'T'HH:mm:ss.s";
  static const String exifDateFormat = "yyyy:MM:dd HH:mm:ss";

  static String getDateString({
    required String? timestamp,
    String outputDateFormat = defaultDateFormat,
    String localeName = 'en',
  }) {
    if (timestamp == null) return "";

    String formattedDate = "";
    try {
      var dateTime = DateTime.tryParse(timestamp);
      var dateTimeLocal = dateTime?.toLocal();

      formattedDate =
          DateFormat(outputDateFormat, localeName).format(dateTimeLocal!);
    } catch (e) {
      Logger().e("$e");
    }

    return formattedDate;
  }

  static String getDateStringFromDateTime({
    required DateTime? dateTime,
    String outputDateFormat = defaultDateFormat,
    String localeName = 'en',
  }) {
    if (dateTime == null) return "";

    String formattedDate = "";
    try {
      var dateTimeLocal = dateTime.toLocal();

      formattedDate =
          DateFormat(outputDateFormat, localeName).format(dateTimeLocal);
    } catch (e) {
      Logger().e("$e");
    }

    return formattedDate;
  }

  static String getLocalizedTimeString({
    required DateTime dateTime,
    String localeName = "en",
    String prefix = "",
  }) {
    DateFormat dateFormat = localeName == "bn"
        ? DateFormat("hh:mm", localeName)
        : DateFormat("hh:mm a", localeName);

    return "${localeName == "bn" ? prefix : ""} ${dateFormat.format(dateTime)}";
  }

  static String getLocalizedCountDownTimerString({
    required int timeInSecond,
    required String localeName,
    String timeFormat = "HH:mm:ss",
  }) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(
      timeInSecond * 1000,
      isUtc: true,
    );

    DateFormat dateFormat = DateFormat(timeFormat, localeName);

    return dateFormat.format(dateTime);
  }

  static DateTime get getCurrentDateTime => DateTime.now();
}
