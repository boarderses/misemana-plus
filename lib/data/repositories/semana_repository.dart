import 'package:sqflite/sqflite.dart';

import '../datasource/database_helper.dart';
import '../models/semana_model.dart';

class SemanaRepository {

  Future<int> insertarSemana(
    SemanaModel semana,
  ) async {

    final Database db =
        await DatabaseHelper.database;

    return await db.insert(
      'semanas',
      semana.toMap(),
    );
  }

  Future<List<SemanaModel>> obtenerSemanas() async {

    final Database db =
        await DatabaseHelper.database;

    final resultado =
        await db.query('semanas');

    return resultado
        .map((e) => SemanaModel.fromMap(e))
        .toList();
  }
}