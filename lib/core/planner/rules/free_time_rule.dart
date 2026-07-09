import '../planner_context.dart';
import '../planner_rule.dart';
import '../time_block.dart';
import 'package:misemana_plus/core/planner/constants/block_priorities.dart';
import 'package:misemana_plus/core/planner/constants/block_types.dart';

class FreeTimeRule implements PlannerRule {

  @override
  List<TimeBlock> apply(
    PlannerContext context,
    List<TimeBlock> blocks,
  ) {
    for (int day = 1; day <= 7; day++) {

    final dayBlocks =
        blocks.where(
          (b) => b.day == day,
        ).toList();

    dayBlocks.sort(
      (a, b) => a.start.compareTo(b.start),
    );
    // Hueco al principio del día
      if (dayBlocks.isNotEmpty &&
          dayBlocks.first.start > 0) {

        blocks.add(
          TimeBlock(
            day: day,
            start: 0,
            end: dayBlocks.first.start,
            type: BlockTypes.free,
            priority: BlockPriorities.free,
          ),
        );

      }
      //Hueco entre bloques
    for (int i = 0; i < dayBlocks.length - 1; i++) {
      final current = dayBlocks[i];
      final next = dayBlocks[i+1];

      if (current.end < next.start) {

          blocks.add(
            TimeBlock(
              day: day,
              start: current.end,
              end: next.start,
              type: BlockTypes.free,
              priority: BlockPriorities.free,
            ),
          ); 
        }
      // Hueco al final del día
      if (dayBlocks.isNotEmpty &&
          dayBlocks.last.end < 1440) {

        blocks.add(
          TimeBlock(
            day: day,
            start: dayBlocks.last.end,
            end: 1440,
            type: BlockTypes.free,
            priority: BlockPriorities.free,
          ),
        );
      }
    }
  }
      return blocks;
  }
}