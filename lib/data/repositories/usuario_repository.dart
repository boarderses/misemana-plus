import 'package:sqflite/sqflite.dart';

import '../datasource/database_helper.dart';
import '../models/usuario_model.dart';

class UsuarioRepository {

  Future<int> insertarUsuario(
    UsuarioModel usuario,
  ) async {

    final Database db =
        await DatabaseHelper.database;

    return await db.insert(
      'usuarios',
      usuario.toMap(),
    );
  }

  Future<List<UsuarioModel>> obtenerUsuarios() async {

    final Database db =
        await DatabaseHelper.database;

    final resultado =
        await db.query('usuarios');

    return resultado
        .map(
          (e) => UsuarioModel.fromMap(e),
        )
        .toList();
  }
}