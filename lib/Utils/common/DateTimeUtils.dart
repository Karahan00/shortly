import 'package:intl/intl.dart';

/// Returns a formatted date string from the given timestamp.
///
/// Converts the provided `TimeStamp` (in seconds) to a `DateTime` and formats it
/// using the specified `format`. The default format is "dd.MM.yyyy".
///
/// Parameters:
/// - `TimeStamp`: The timestamp in seconds to convert.
/// - `format`: An optional string that defines the desired date format. The default value is "dd.MM.yyyy".
///
/// Returns:
/// - A string representing the formatted date.
String getDateFrom(int TimeStamp, {String? format = "dd.MM.yyyy"}){
  final dateFromTimeStamp = DateTime.fromMillisecondsSinceEpoch(TimeStamp * 1000);
  return DateFormat(format).format(dateFromTimeStamp);
}

/// Returns a formatted date string from the given `DateTime` object.
///
/// This function allows you to format any `DateTime` object using the specified `format`.
/// The default format is "dd.MM.yyyy".
///
/// Parameters:
/// - `date`: The `DateTime` object to format.
/// - `format`: An optional string that defines the desired date format. The default value is "dd.MM.yyyy".
///
/// Returns:
/// - A string representing the formatted date.
String getDateWithFormat(DateTime date, {String? format = "dd.MM.yyyy"}) {
  return DateFormat(format).format(date);
}

/// Returns a human-readable string representing how much time has passed
/// since the given timestamp.
///
/// This function calculates the difference between the current date and time
/// and the provided `TimeStamp` (in seconds), returning a string that expresses
/// the elapsed time in seconds, minutes, hours, days, weeks, months, or years.
///
/// Parameters:
/// - `TimeStamp`: The timestamp (in seconds) to calculate the time difference from.
///
/// Returns:
/// - A string representing the time passed (e.g., "vor 5 Minuten", "vor 2 Tagen", "vor 1 Jahr").
String getTimeAgoDisplay(double TimeStamp) {

  var now = DateTime.now();
  var date = DateTime.fromMillisecondsSinceEpoch(TimeStamp.toInt() * 1000);
  var diff = now.difference(date);
  var time = '';

  // Conditions for differences to determine state of the time elements in Strings
  if (diff.inSeconds <= 0
      || diff.inSeconds > 0 && diff.inMinutes == 0
      || diff.inMinutes > 0 && diff.inHours == 0
      || diff.inHours > 0 && diff.inDays == 0) {
    // Checks the seconds here
    if (diff.inSeconds <= 60) {
      time = "vor ${diff.inSeconds} Sekunden";
    }
    // Checks the minutes here
    else if (diff.inMinutes <= 60) {
      time = "vor ${diff.inMinutes} Minuten";
    }
    // Checks the hours here
    else if (diff.inHours <= 24) {
      time = "vor ${diff.inHours} Stunden";
    }
  }
  // Checks the days here
  else if (diff.inDays > 0 && diff.inDays < 7) {
    time = "vor ${diff.inDays} Tagen";
  }
  // Checks the weeks here
  else if  (diff.inDays == 7 || diff.inDays > 7) {
    time = "vor ${(diff.inDays / 7).floor()} Wochen";
  }
  // Checks the months here
  else if (diff.inDays >= 30) {
    time = "vor ${(diff.inDays / 7).floor()} Monaten";
  }
  // Checks the jahr here
  else {
    time = "vor ${(diff.inDays / 364).floor()} Jahren";
  }

  return time;
}