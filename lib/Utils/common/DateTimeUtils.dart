import 'package:intl/intl.dart';

// Returns a date string from given TimeStamp and format
String getDateFrom(int TimeStamp, {String? format = "dd.MM.yyyy"}){
  final dateFromTimeStamp = DateTime.fromMillisecondsSinceEpoch(TimeStamp * 1000);
  return DateFormat(format).format(dateFromTimeStamp);
}

String getDateWithFormat(DateTime date, {String? format = "dd.MM.yyyy"}) {
  return DateFormat(format).format(date);
}

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