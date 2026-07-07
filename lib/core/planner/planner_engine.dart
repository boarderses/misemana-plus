import 'planner_rule.dart';
import 'time_block.dart';
import 'rules/sleep_rule.dart';
import 'rules/work_rule.dart';
import 'planner_context.dart';

class PlannerEngine {

  final List<PlannerRule> rules = [
    SleepRule(),
    WorkRule(),
  ];

  List<TimeBlock> generate( 
    PlannerContext context,
  ){

    List<TimeBlock> blocks = [];

    for (final rule in rules) {
      blocks = rule.apply(
        context,
        blocks,
      );
    }
    return blocks;
  }
}