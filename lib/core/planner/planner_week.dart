import 'time_block.dart';

class PlannerWeek {
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
