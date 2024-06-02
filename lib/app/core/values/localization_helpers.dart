import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
//import 'package:translator/translator.dart';

String getCurrentLocal(BuildContext context) {
  return Localizations.localeOf(context).languageCode;
}

bool isBanglaLanguage(BuildContext context) {
  var lan = getCurrentLocal(context);
  return lan == 'bn';
}

String formatDayName(int unixTimestamp, BuildContext context) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
  return DateFormat('EEEE', getCurrentLocal(context)).format(date);
}
String formatWeekDayName(int unixTimestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
  return DateFormat('EEEE').format(date);
}
String formatDate(int unixTime, BuildContext context) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
  return DateFormat('dd-MM-yyyy', getCurrentLocal(context)).format(dateTime);
}

String formatTemperature(dynamic temperature, BuildContext context) {
  final locale = getCurrentLocal(context);
  if (locale == 'bn') {
    if (temperature is double) {
      return '${NumberFormat.decimalPattern(locale).format(temperature.toInt())}°c';
    } else {
      return '${NumberFormat.decimalPattern(locale).format(temperature)}°c';
    }
  } else {
    return '${temperature.toStringAsFixed(1)}°c';
  }
}

// Future<String> translateText(String text, BuildContext context) async {
//   GoogleTranslator translator = new GoogleTranslator();
//   var banglaText = await translator.translate(text, from: 'en', to: 'bn');
//   final locale = getCurrentLocal(context);
//   if (locale == 'bn') {
//     return banglaText.text;
//   } else {
//     return text;
//   }
// }
