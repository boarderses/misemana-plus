class DayDateUtils {

  static DateTime getDateForDay(
    int day,
  ) {

    final today = DateTime.now();
    final monday = today.subtract(
      Duration(
        days: today.weekday - 1,
      ),
    );

    return monday.add(
      Duration(
        days: day - 1,
      ),
    );

  }
  static String formatDate(
    DateTime date,
  ){

    return "${date.day}/${date.month}";
  }
  static bool isToday(int dayNumber) {

    final today =
        DateTime.now();

    final currentDay =
        today.weekday;

    return currentDay == dayNumber;
  }
}