class TimeUtils {

  static int toMinutes(String time) {

    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    return hour * 60 + minute;

  }

  static String fromMinutes(int minutes) {

    if (minutes == 1440){
      return "24:00";
    }

    final hour = (minutes ~/ 60)
        .toString()
        .padLeft(2, '0');

    final minute = (minutes % 60)
        .toString()
        .padLeft(2, '0');

    return "$hour:$minute";

  }
  static bool crossesMidnight(
  int start,
  int end,
) {
  return start > end;
}

static bool overlaps(
  int start1,
  int end1,
  int start2,
  int end2,
) {
  return start1 < end2 &&
         end1 > start2;
}

}