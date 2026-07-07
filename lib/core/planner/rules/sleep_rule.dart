import '../block_priorities.dart';
import '../block_types.dart';
import '../planner_context.dart';
import '../planner_rule.dart';
import '../time_block.dart';
import '../time_utils.dart';

class SleepRule implements PlannerRule {

  @override
  List<TimeBlock> apply(
    PlannerContext context,
    List<TimeBlock> blocks,
  ) {

    final dormir = TimeUtils.toMinutes(context.usuario.horaDormir,);
    final despertar = TimeUtils.toMinutes(context.usuario.horaDespertar,);

    for (int day = 1; day <= 7; day++){
      blocks.add(
          TimeBlock(
          day: day,
          start: 0,
          end: despertar,
          type: BlockTypes.sleep,
          priority: BlockPriorities.sleep,
        ),
      );
      blocks.add(
          TimeBlock(
          day: day,
          start: dormir,
          end: 1440,
          type: BlockTypes.sleep,
          priority: BlockPriorities.sleep,
        ),
      );
    }
    return blocks;
  }
}