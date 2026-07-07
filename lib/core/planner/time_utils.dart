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

}