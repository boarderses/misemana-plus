
import 'package:misemana_plus/core/planner/constants/block_priorities.dart';
import 'package:misemana_plus/core/planner/constants/block_types.dart';
import 'package:misemana_plus/core/planner/constants/objective_types.dart';
import 'package:misemana_plus/core/planner/rules/objetive_rule.dart';

class StudyRule extends ObjectiveRule {

  @override
  String get objectiveType => ObjectiveTypes.estudio;

  @override
  String get blockType => BlockTypes.study;

  @override
  int get priority => BlockPriorities.study;

  @override
  int get sessionMinutes => 120;

}