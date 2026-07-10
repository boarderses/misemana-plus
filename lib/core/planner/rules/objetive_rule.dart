import 'package:misemana_plus/core/planner/block_allocator.dart';
import '../planner_context.dart';
import '../planner_rule.dart';
import '../time_block.dart';

abstract class ObjectiveRule implements PlannerRule {

  final BlockAllocator allocator = BlockAllocator();
  String get objectiveType;
  String get blockType;
  int get priority;
  int get sessionMinutes;

  @override
  List<TimeBlock> apply(
    PlannerContext context,
    List<TimeBlock> blocks,
  ) {

    final objetivos = context.objetivos.where(
      (o) => o.tipo == objectiveType,
    );

    if (objetivos.isEmpty) {
      return blocks;
    }

    final objetivo = objetivos.first;

    int minutosPendientes = objetivo.cantidad * 60;

    while (minutosPendientes > 0) {

      final minutos = minutosPendientes >= sessionMinutes
          ? sessionMinutes
          : minutosPendientes;

      final allocated = allocator.allocate(
        blocks,
        minutos,
        blockType,
        priority,
      );

      if (!allocated) {
        break;
      }
      minutosPendientes -= minutos;
    }
    print(
      "$objectiveType sin planificar: $minutosPendientes minutos",
    );

    return blocks;
  }
}
