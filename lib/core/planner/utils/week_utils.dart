class WeekUtils {

  /// Devuelve el lunes de la semana correspondiente a [date].
  static DateTime getStartOfWeek(
    DateTime date,
  ) {

    return DateTime(
      date.year,
      date.month,
      date.day,
    ).subtract(
      Duration(
        days: date.weekday - 1,
      ),
    );
  }


  /// Devuelve el domingo de la semana correspondiente a [date].
  static DateTime getEndOfWeek(
    DateTime date,
  ) {

    return getStartOfWeek(date).add(
      const Duration(
        days: 6,
      ),
    );
  }


  /// Formatea una fecha como dd/MM.
  static String formatDate(
    DateTime date,
  ) {

    final day =
        date.day.toString().padLeft(2, '0');

    final month =
        date.month.toString().padLeft(2, '0');

    return "$day/$month";
  }

  static int getWeekNumber(
    DateTime date,
  ) {

    final startOfWeek =
        getStartOfWeek(date);

    final thursday =
        startOfWeek.add(
      const Duration(days: 3),
    );

    final isoYear =
        thursday.year;

    final firstMonday =
        getStartOfWeek(
      DateTime(
        isoYear,
        1,
        4,
      ),
    );

    return
        ((startOfWeek.difference(firstMonday).inDays) ~/ 7) + 1;
  }
/// Devuelve el número y año de la siguiente semana ISO.
static Map<String, int> getNextWeek() {

  final now = DateTime.now();

  final nextWeekDate =
      getStartOfWeek(now).add(
    const Duration(days: 7),
  );

  return {
    'semana': getWeekNumber(nextWeekDate),
    'anio': nextWeekDate.year,
  };
}

  /// Devuelve el texto de la semana actual.
  static String getCurrentWeekText() {

    final now =
        DateTime.now();

    final start =
        getStartOfWeek(now);

    final end =
        getEndOfWeek(now);

    return "Semana "
        "${getWeekNumber(now)}\n"
        "Del ${formatDate(start)} - "
        "${formatDate(end)}";
  }
  /// Devuelve el lunes de una semana concreta.
static DateTime getStartOfWeekNumber(
  int weekNumber,
  int year,
) {

  final january4 =
      DateTime(year, 1, 4);

  final firstMonday =
      getStartOfWeek(january4);

  return firstMonday.add(
    Duration(
      days: (weekNumber - 1) * 7,
    ),
  );
}

/// Devuelve el domingo de una semana concreta.
static DateTime getEndOfWeekNumber(
    int weekNumber,
    int year,
  ) {

    return getStartOfWeekNumber(
      weekNumber,
      year,
    ).add(
      const Duration(days: 6),
    );
  }
}