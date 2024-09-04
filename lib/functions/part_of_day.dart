String formatDateAsString(int day, int month, int year) {
  String ordinalSuffix;
  if (day == 1 || day == 21 || day == 31) {
    ordinalSuffix = "st";
  } else if (day == 2 || day == 22) {
    ordinalSuffix = "nd";
  } else if (day == 3 || day == 23) {
    ordinalSuffix = "rd";
  } else {
    ordinalSuffix = "th";
  }
  List<String> monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  String monthName = monthNames[month - 1];

  return "$day$ordinalSuffix $monthName $year";
}

String getPartOfDay(int hour) {
  if (hour >= 5 && hour < 12) {
    return "Morning";
  } else if (hour >= 12 && hour < 17) {
    return "Afternoon";
  } else if (hour >= 17 && hour < 20) {
    return "Evening";
  } else {
    return "Night";
  }
}

