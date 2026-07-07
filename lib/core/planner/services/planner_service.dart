import '../../../data/repositories/objetivo_repository.dart';
import '../../../data/repositories/turno_repository.dart';
import '../../../data/repositories/usuario_repository.dart';
import '../planner_context.dart';
import '../planner_engine.dart';
import '../time_block.dart';

class PlannerService {

  final PlannerEngine engine = PlannerEngine();
  final UsuarioRepository usuarioRepository = UsuarioRepository();
  final TurnoRepository turnoRepository = TurnoRepository();
  final ObjetivoRepository objetivoRepository = ObjetivoRepository();

  Future<List<TimeBlock>> generate(
    int semanaId,
  ) async {

    final usuario =
        await usuarioRepository.obtenerPrimerUsuario();

    if (usuario == null) {
      return [];
    }

    final turnos =
        await turnoRepository.obtenerTurnosSemana(
      semanaId,
    );

    final objetivos =
        await objetivoRepository.obtenerObjetivosSemana(
      semanaId,
    );

    final context = PlannerContext(
      usuario: usuario,
      turnos: turnos,
      objetivos: objetivos,
    );

    return engine.generate(context);

  }
}