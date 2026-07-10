import 'package:misemana_plus/core/planner/constants/block_priorities.dart';
import 'package:misemana_plus/core/planner/constants/block_types.dart';
import 'package:misemana_plus/core/planner/constants/objective_types.dart';
import 'package:misemana_plus/core/planner/rules/objetive_rule.dart';

class SportRule extends ObjectiveRule {

  @override
  String get objectiveType => ObjectiveTypes.deporte;

  @override
  String get blockType => BlockTypes.sport;

  @override
  int get priority => BlockPriorities.sport;

  @override
  int get sessionMinutes => 60;
}