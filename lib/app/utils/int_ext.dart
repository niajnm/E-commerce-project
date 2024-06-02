import 'package:weather_assesment/app/utils/constants.dart';
import 'package:intl/intl.dart';

extension IntExtenstions on int {
  double hoursToDay() {
    return this / (MAX_HOURS);
  }

  int hoursToMinutes() {
    return (this * MAX_MINUTES).toInt();
  }

  double minutesToDay() {
    return this / (MAX_MINUTES * MAX_HOURS);
  }

  double secondsToDay() {
    return this / (MAX_MINUTES * MAX_HOURS * MAX_SECONDS);
  }

  String localizedNumber(String localeName) {
    return NumberFormat("###", localeName).format(this);
  }
}
