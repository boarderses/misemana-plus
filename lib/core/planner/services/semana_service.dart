import 'package:misemana_plus/data/repositories/semana_repository.dart';
import 'package:misemana_plus/data/repositories/turno_repository.dart';
import 'package:misemana_plus/data/repositories/objetivo_repository.dart';
import 'package:misemana_plus/data/models/semana_model.dart';
import 'package:misemana_plus/core/planner/utils/week_utils.dart';

class SemanaService {

  final SemanaRepository semanaRepository =
      SemanaRepository();

  final TurnoRepository turnoRepository =
      TurnoRepository();

  final ObjetivoRepository objetivoRepository =
      ObjetivoRepository();

  Future<List<SemanaModel>> obtenerSemanas() async {

    return await semanaRepository.obtenerTodas();

  }

  Future<SemanaModel?> obtenerSemanaPorId(
    int id,
  ) async {

    return await semanaRepository.obtenerSemanaPorId(id);

  }

  Future<bool> copiarSemanaAnterior(
    SemanaModel semanaDestino,
  ) async {

    final inicioSemana =
        WeekUtils.getStartOfWeekNumber(
      semanaDestino.numeroSemana,
      semanaDestino.anio,
    );

    final fechaSemanaAnterior =
        inicioSemana.subtract(
      const Duration(days: 7),
    );

    final numeroSemanaAnterior =
        WeekUtils.getWeekNumber(
      fechaSemanaAnterior,
    );

    final anioSemanaAnterior =
        fechaSemanaAnterior.year;

    final semanaAnterior =
        await semanaRepository.obtenerSemana(
      semanaDestino.usuarioId,
      numeroSemanaAnterior,
      anioSemanaAnterior,
    );

    if (semanaAnterior == null) {
      return false;
    }

    await turnoRepository.copiarTurnosSemana(
      semanaAnterior.id!,
      semanaDestino.id!,
    );

    await objetivoRepository.copiarObjetivosSemana(
      semanaAnterior.id!,
      semanaDestino.id!,
    );

    return true;
  }
}