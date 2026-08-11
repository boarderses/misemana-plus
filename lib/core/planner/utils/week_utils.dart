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


  /// Obtiene el número ISO de semana.
  static int getWeekNumber(
    DateTime date,
  ) {

    final thursday =
        date.add(
          Duration(
            days: 4 - date.weekday,
          ),
        );

    final firstThursday =
        DateTime(
          thursday.year,
          1,
          4,
        );

    final difference =
        thursday.difference(
          firstThursday,
        ).inDays;

    return 1 + (difference / 7).floor();
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