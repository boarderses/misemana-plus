import 'package:misemana_plus/core/planner/block_allocator.dart';
import 'package:misemana_plus/core/planner/constants/block_priorities.dart';
import 'package:misemana_plus/core/planner/constants/block_types.dart';
import 'package:misemana_plus/core/planner/constants/objective_types.dart';
import '../planner_context.dart';
import '../planner_rule.dart';
import '../time_block.dart';

class StudyRule implements PlannerRule {

  final BlockAllocator allocator = BlockAllocator();

  @override
  List<TimeBlock> apply(
    PlannerContext context,
    List<TimeBlock> blocks,
  ) {
    final objetivo = context.objetivos.firstWhere(
      (o)=> o.tipo == ObjectiveTypes.estudio);
    int minutosPendientes = objetivo.cantidad * 60;
    const minutosSesion = 120;

    while(minutosPendientes > 0){
      final minutos = minutosPendientes >= minutosSesion
        ? minutosSesion : minutosPendientes;
    
      final allocated = allocator.allocate(
        blocks, 
        minutos,
        BlockTypes.study,
        BlockPriorities.study,);

        if (!allocated){
          break;
        }
        minutosPendientes -= minutos;
    }
    print("Minutos de estudio restante: $minutosPendientes");

    return blocks;
  }
}