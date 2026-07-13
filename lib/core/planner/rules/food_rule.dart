import 'package:misemana_plus/core/planner/constants/block_priorities.dart';
import 'package:misemana_plus/core/planner/constants/block_types.dart';
import 'package:misemana_plus/core/planner/constants/meal_constants.dart';
import 'package:misemana_plus/core/planner/time_window_allocator.dart';

import '../planner_context.dart';
import '../planner_rule.dart';
import '../time_block.dart';

class FoodRule implements PlannerRule {

  final TimeWindowAllocator allocator =
      TimeWindowAllocator();

  @override
  List<TimeBlock> apply(
    PlannerContext context,
    List<TimeBlock> blocks,
  ) {
    for (int day = 1; day <= 7; day++) {
      allocator.allocate(
      blocks,
      day,
      MealConstants.breakfastStart,
      MealConstants.breakfastEnd,
      MealConstants.breakfastIdeal,
      MealConstants.breakfastDuration,
      BlockTypes.food,
      BlockPriorities.food,
    );
      allocator.allocate(
      blocks,
      day,
      MealConstants.lunchStart,
      MealConstants.lunchEnd,
      MealConstants.lunchIdeal,
      MealConstants.lunchDuration,
      BlockTypes.food,
      BlockPriorities.food,
    );
      allocator.allocate(
      blocks,
      day,
      MealConstants.dinnerStart,
      MealConstants.dinnerEnd,
      MealConstants.dinnerIdeal,
      MealConstants.dinnerDuration,
      BlockTypes.food,
      BlockPriorities.food,
    );
    }
    return blocks;
  }
}