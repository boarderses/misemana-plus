import '../planner_rule.dart';
import '../time_block.dart';
import '../planner_context.dart';

class WorkRule implements PlannerRule {

  @override
  List<TimeBlock> apply(
    PlannerContext context,
    List<TimeBlock> blocks,
  ) {
    return blocks;
  }
}