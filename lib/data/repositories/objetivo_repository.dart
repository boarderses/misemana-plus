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

  Future<List<ObjetivoModel>> obtenerObjetivos(
      int usuarioId) async {

    final Database db =
        await DatabaseHelper.database;

    final resultado = await db.query(
      'objetivos',
      where: 'usuarioId = ?',
      whereArgs: [usuarioId],
    );

    return resultado
        .map((e) => ObjetivoModel.fromMap(e))
        .toList();
  }
}