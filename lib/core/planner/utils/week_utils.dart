class WeekUtils {


  static DateTime getStartOfWeek(
    DateTime date,
  ) {

    return date.subtract(
      Duration(
        days: date.weekday - 1,
      ),
    );
  }
  
  static DateTime getEndOfWeek(
    DateTime date,
  ) {

    return getStartOfWeek(date).add(
      const Duration(
        days: 6,
      ),
    );
  }

  static String formatDate(
    DateTime date,
  ) {

    return "${date.day}/${date.month}";

  }

  static String getCurrentWeekText() {

    final now = DateTime.now();
    final start =
        getStartOfWeek(now);
    final end =
        getEndOfWeek(now);

    return "Semana "
        "${getWeekNumber(now)}\n"
        "Del ${formatDate(start)} - "
        "${formatDate(end)}";
  }
  static int getWeekNumber(
      DateTime date,) {

    final firstDay =
        DateTime(date.year, 1, 1);

    final difference =
        date.difference(firstDay).inDays;

    return (difference / 7).ceil();

  }
}