import 'day_free_time.dart';
import 'time_block.dart';
import 'constants/block_types.dart';

class FreeTimeAnalyzer {

  List<DayFreeTime> analyze(
    List<TimeBlock> blocks,
  ) {

    final Map<int, int> totals = {};

    for (int day = 1; day <= 7; day++) {
      totals[day] = 0;
    }

    for (final block in blocks) {

      if (block.type != BlockTypes.free) {
        continue;
      }

      totals[block.day] =
          totals[block.day]! +
          (block.end - block.start);

    }
    final result = totals.entries.map((entry) {

      return DayFreeTime(
        day: entry.key,
        minutes: entry.value,
      );

    }).toList();

    result.sort((a, b) =>
    b.minutes.compareTo(a.minutes));

    return result;
  }
}