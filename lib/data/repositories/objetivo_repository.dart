import 'package:sqflite/sqflite.dart';

import '../datasource/database_helper.dart';
import '../models/objetivo_model.dart';

class ObjetivoRepository {

  Future<int> insertarObjetivo(
      ObjetivoModel objetivo) async {

    final Database db =
        await DatabaseHelper.database;

    return await db.insert(
      'objetivos',
      objetivo.toMap(),
    );
  }

  Future<List<ObjetivoModel>> obtenerObjetivosSemana(
      int semanaId) async {

    final Database db =
        await DatabaseHelper.database;

    final resultado = await db.query(
      'objetivos',
      where: 'semanaId = ?',
      whereArgs: [semanaId],
    );

    return resultado
        .map((e) => ObjetivoModel.fromMap(e))
        .toList();
  }
  Future<void> eliminarObjetivosSemana(
    int semanaId,) async {

   final Database db =
      await DatabaseHelper.database;

      await db.delete(
        'objetivos',
        where: 'semanaId = ?',
        whereArgs: [semanaId],
       );
    }
    Future<void> copiarObjetivosSemana(
      int semanaOrigenId,
      int semanaDestinoId,
      ) async {
        final objetivos =
            await obtenerObjetivosSemana(semanaOrigenId);

        for (final objetivo in objetivos) {
          final nuevoObjetivo = ObjetivoModel(
            semanaId: semanaDestinoId,
            tipo: objetivo.tipo,
            cantidad: objetivo.cantidad,
          );

          await insertarObjetivo(nuevoObjetivo);
        }
      }
    }