import 'package:misemana_plus/core/planner/constants/block_priorities.dart';
import 'package:misemana_plus/core/planner/constants/block_types.dart';
import 'package:misemana_plus/core/planner/constants/objective_types.dart';
import 'package:misemana_plus/core/planner/rules/objetive_rule.dart';

class PersonalTimeRule extends ObjectiveRule{

  @override
  String get objectiveType => ObjectiveTypes.tiempoPersonal;

  @override
  String get blockType => BlockTypes.personal;

  @override
  int get priority => BlockPriorities.personal;

  @override
  int get sessionMinutes => 30;
}