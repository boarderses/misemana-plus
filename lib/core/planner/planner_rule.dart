import 'time_block.dart';
import 'planner_context.dart';

abstract class PlannerRule {

  List<TimeBlock> apply(
    PlannerContext context,
    List<TimeBlock> blocks,
  );
}