import 'package:misemana_plus/core/planner/time_utils.dart';
import '../planner_rule.dart';
import '../time_block.dart';
import '../planner_context.dart';
import 'package:misemana_plus/core/planner/constants/block_priorities.dart';
import 'package:misemana_plus/core/planner/constants/block_types.dart';

class WorkRule implements PlannerRule {

  @override
  List<TimeBlock> apply(
    PlannerContext context,
    List<TimeBlock> blocks,
    ) {
    for (final turno in context.turnos) {

    final inicio = TimeUtils.toMinutes(turno.horaInicio,);

    final fin = TimeUtils.toMinutes(turno.horaFin,);
    if (!TimeUtils.crossesMidnight(inicio,fin,)) {
        blocks.add(
      TimeBlock(
        day: turno.dia,
        start: inicio,
        end: fin,
        type: BlockTypes.work,
        priority: BlockPriorities.work,
      ),
    );

      }
      else { 
        blocks.add(
          TimeBlock(
            day: turno.dia,
            start: inicio,
            end: 1440,
            type: BlockTypes.work,
            priority: BlockPriorities.work,
          ),
        );
        blocks.add(
          TimeBlock(
            day: turno.dia == 7 ? 1 : turno.dia +1,
            start: 0,
            end: fin,
            type: BlockTypes.work,
            priority: BlockPriorities.work,
          ),
        );
      }
    }
    return blocks;
    }
  }
