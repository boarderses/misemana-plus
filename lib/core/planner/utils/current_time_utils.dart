class CurrentTimeUtils {

  static int getCurrentMinutes() {

    final now = DateTime.now();

    return now.hour * 60 + now.minute;
  }

  static bool isCurrentBlock(
    int start,
    int end,
  ) {

    final current =
        getCurrentMinutes();

    return current >= start &&
           current <= end;
  }
}