import 'package:sqflite/sqflite.dart';

import '../datasource/database_helper.dart';
import '../models/turno_model.dart';

class TurnoRepository {

  Future<int> insertarTurno(
    TurnoModel turno,
  ) async {

    final Database db =
        await DatabaseHelper.database;

    return await db.insert(
      'turnos',
      turno.toMap(),
    );
  }

  Future<List<TurnoModel>> obtenerTurnosSemana(
    int semanaId,
  ) async {

    final Database db =
        await DatabaseHelper.database;

    final resultado = await db.query(
      'turnos',
      where: 'semanaId = ?',
      whereArgs: [semanaId],
      orderBy: 'dia ASC, horaInicio ASC',
    );

    return resultado
        .map((e) => TurnoModel.fromMap(e))
        .toList();
  }

  Future<List<TurnoModel>> obtenerTurnosDia(
    int semanaId,
    int dia,
  ) async {

    final Database db =
        await DatabaseHelper.database;

    final resultado = await db.query(
      'turnos',
      where: 'semanaId = ? AND dia = ?',
      whereArgs: [semanaId, dia],
      orderBy: 'horaInicio ASC',
    );

    return resultado
        .map((e) => TurnoModel.fromMap(e))
        .toList();
  }
  Future<void> eliminarTurno(int id) async {

    final Database db =
        await DatabaseHelper.database;

        await db.delete(
          'turnos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}