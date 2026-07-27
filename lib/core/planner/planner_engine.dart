import 'package:misemana_plus/core/planner/rules/food_rule.dart';
import 'package:misemana_plus/core/planner/rules/free_time_rule.dart';
import 'package:misemana_plus/core/planner/rules/leisure_rule.dart';
import 'package:misemana_plus/core/planner/rules/personal_time_rule.dart';
import 'package:misemana_plus/core/planner/rules/study_rule.dart';

import 'planner_rule.dart';
import 'time_block.dart';
import 'planner_context.dart';
import 'planner_week.dart';

import 'rules/sleep_rule.dart';
import 'rules/work_rule.dart';
import 'rules/sport_rule.dart';

class PlannerEngine {

  final List<PlannerRule> rules = [
    SleepRule(),
    WorkRule(),
    FreeTimeRule(),
    FoodRule(),
    StudyRule(),
    SportRule(),
    LeisureRule(),
    PersonalTimeRule(),
  ];

  PlannerWeek generate( 
    PlannerContext context,
  ){

    List<TimeBlock> blocks = [];

    for (final rule in rules) {
      blocks = rule.apply(
        context,
        blocks,
      );
    }
    return _buildWeek(blocks);
  }

  PlannerWeek _buildWeek(
    List<TimeBlock> blocks,
  ) {
    final Map<int, List<TimeBlock>> grouped = {};

    // Agrupar bloques por día
    for (final block in blocks) {
      grouped
          .putIfAbsent(
            block.day,
            () => [],
          )
          .add(block);
    }
    // Ordenar cronológicamente
    for (final dayBlocks in grouped.values) {

      dayBlocks.sort(
        (a, b) =>
            a.start.compareTo(b.start,),
      );
    }
    return PlannerWeek(
      days: grouped,
    );
  }
}
