import 'package:intl/intl.dart';

String formatCurrency(num amount, {int decimalCount = 0}) {
  final formatCurrency =
      new NumberFormat.simpleCurrency(decimalDigits: decimalCount);
  return formatCurrency.format(amount);
}

String formatPostedDate(num tsMillisecondsEpoch) {
  num timePostedRelativeToNow =
      DateTime.now().millisecondsSinceEpoch - tsMillisecondsEpoch;

  // less than a hour
  if (timePostedRelativeToNow < MILLISECONDS_TO_TIME_UNIT["hour"]) {
    int minsSincePost =
        DateTime.fromMillisecondsSinceEpoch(timePostedRelativeToNow).minute;
    return "$minsSincePost minute${addPlural(minsSincePost)} ago";
  }
  // less than a day
  if (timePostedRelativeToNow < MILLISECONDS_TO_TIME_UNIT["day"]) {
    int hrsSincePost =
        DateTime.fromMillisecondsSinceEpoch(timePostedRelativeToNow).hour - 1;
    return "$hrsSincePost hour${addPlural(hrsSincePost)} ago";
  }
  // less than a week
  if (timePostedRelativeToNow < MILLISECONDS_TO_TIME_UNIT["week"]) {
    int daysSincePost =
        DateTime.fromMillisecondsSinceEpoch(timePostedRelativeToNow).day - 1;
    return "$daysSincePost day${addPlural(daysSincePost)} ago";
  }
  // less than a month
  if (timePostedRelativeToNow < MILLISECONDS_TO_TIME_UNIT["month"]) {
    int daysSincePost =
        DateTime.fromMillisecondsSinceEpoch(timePostedRelativeToNow).day - 1;
    int weeksSincePost = (daysSincePost / 7).floor();
    return "$weeksSincePost week${addPlural(weeksSincePost)} ago";
  }
  // less than a year
  if (timePostedRelativeToNow < MILLISECONDS_TO_TIME_UNIT["year"]) {
    int monthsSincePost =
        DateTime.fromMillisecondsSinceEpoch(timePostedRelativeToNow).month - 1;
    return "$monthsSincePost month${addPlural(monthsSincePost)} ago";
  }
  num yearsSincePost =
      timePostedRelativeToNow / MILLISECONDS_TO_TIME_UNIT["year"].floor();
  return "$yearsSincePost minute${addPlural(yearsSincePost)} ago";
}

String addPlural(num n) {
  if (n > 1) {
    return "s";
  }
  return "";
}

const MILLISECONDS_TO_TIME_UNIT = {
  "hour": 3600000,
  "day": 86400000,
  "week": 604800000,
  "month": 2628000000,
  "year": 31540000000
};
