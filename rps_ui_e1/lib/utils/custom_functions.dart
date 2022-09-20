import 'package:intl/intl.dart';

String formatCurrency(num amount, {int decimalCount = 0}) {
  final formatCurrency =
      new NumberFormat.simpleCurrency(decimalDigits: decimalCount);
  return formatCurrency.format(amount);
}

String formatPostedDate(num ts_milli_epoch) {
  num time_posted_relative_to_now =
      DateTime.now().millisecondsSinceEpoch - ts_milli_epoch;

  // less than a hour
  if (time_posted_relative_to_now < MILLISECONDS_TO_TIME_UNIT["hour"]) {
    int mins_since_post =
        DateTime.fromMillisecondsSinceEpoch(time_posted_relative_to_now).minute;
    return "${mins_since_post} minute${addPlural(mins_since_post)} ago";
  }
  // less than a day
  if (time_posted_relative_to_now < MILLISECONDS_TO_TIME_UNIT["day"]) {
    int hrs_since_post =
        DateTime.fromMillisecondsSinceEpoch(time_posted_relative_to_now).hour -
            1;
    return "${hrs_since_post} hour${addPlural(hrs_since_post)} ago";
  }
  // less than a week
  if (time_posted_relative_to_now < MILLISECONDS_TO_TIME_UNIT["week"]) {
    int days_since_post =
        DateTime.fromMillisecondsSinceEpoch(time_posted_relative_to_now).day;
    return "${days_since_post} day${addPlural(days_since_post)} ago";
  }
  // less than a month
  if (time_posted_relative_to_now < MILLISECONDS_TO_TIME_UNIT["month"]) {
    int days_since_post =
        DateTime.fromMillisecondsSinceEpoch(time_posted_relative_to_now).day;
    int weeks_since_post = (days_since_post / 7).floor();
    return "${weeks_since_post} week${addPlural(weeks_since_post)} ago";
  }
  // less than a year
  if (time_posted_relative_to_now < MILLISECONDS_TO_TIME_UNIT["year"]) {
    int months_since_post =
        DateTime.fromMillisecondsSinceEpoch(time_posted_relative_to_now).month;
    return "${months_since_post} month${addPlural(months_since_post)} ago";
  }
  num years_since_post =
      time_posted_relative_to_now / MILLISECONDS_TO_TIME_UNIT["year"].floor();
  return "${years_since_post} minute${addPlural(years_since_post)} ago";
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
