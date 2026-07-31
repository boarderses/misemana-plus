import 'time_block.dart';
import 'planner_day.dart';


class PlannerWeek {

  String getDayName(
  int day,
){
  return PlannerDay
      .fromNumber(day)
      .name;
}
  final Map<int, List<TimeBlock>> days;

  const PlannerWeek({
    required this.days,
  });

  List<TimeBlock> blocksForDay(int day) {
    return days[day] ?? [];
  }

  bool hasBlocks(int day) {
    return blocksForDay(day).isNotEmpty;
  }

  int get totalBlocks {
    return days.values.fold(
      0,
      (total, blocks) => total + blocks.length,
    );
  }
}
