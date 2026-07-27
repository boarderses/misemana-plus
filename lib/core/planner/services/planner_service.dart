import '../../../data/repositories/objetivo_repository.dart';
import '../../../data/repositories/turno_repository.dart';
import '../../../data/repositories/usuario_repository.dart';

import '../planner_context.dart';
import '../planner_engine.dart';
import '../planner_week.dart';
import '../time_block.dart';

class PlannerService {

  final PlannerEngine engine = PlannerEngine();
  final UsuarioRepository usuarioRepository = UsuarioRepository();
  final TurnoRepository turnoRepository = TurnoRepository();
  final ObjetivoRepository objetivoRepository = ObjetivoRepository();

  Future<PlannerWeek> generate(
    int semanaId,
  ) async {

    final usuario =
        await usuarioRepository.obtenerPrimerUsuario();
    print("Usuario: $usuario");

    if (usuario == null) {
      return const PlannerWeek(days: {},);
    }

    final turnos =
        await turnoRepository.obtenerTurnosSemana(
      semanaId,
    );
    print("Turnos: ${turnos.length}");

    final objetivos =
        await objetivoRepository.obtenerObjetivosSemana(
      semanaId,
    );
    print("Objetivos: ${objetivos.length}");

    final context = PlannerContext(
      usuario: usuario,
      turnos: turnos,
      objetivos: objetivos,
    );
    final resultado = engine.generate(context);
    print("Bloques generados: ${resultado.totalBlocks}");
    return resultado;
  }
  List<TimeBlock> getDayPlan(
    PlannerWeek week,
    int day,
  ){
    return week.blocksForDay(day);
  }
}