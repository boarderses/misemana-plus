import 'package:misemana_plus/core/planner/constants/block_priorities.dart';
import 'package:misemana_plus/core/planner/constants/block_types.dart';
import 'package:misemana_plus/core/planner/constants/objective_types.dart';
import 'package:misemana_plus/core/planner/rules/objetive_rule.dart';

class LeisureRule extends ObjectiveRule {

  @override
  String get objectiveType => ObjectiveTypes.ocio;

  @override
  String get blockType => BlockTypes.leisure;

  @override
  int get priority => BlockPriorities.leisure;

  @override
  int get sessionMinutes => 60;
}