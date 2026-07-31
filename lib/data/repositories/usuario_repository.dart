import 'package:sqflite/sqflite.dart';

import '../datasource/database_helper.dart';
import '../models/usuario_model.dart';

class UsuarioRepository {

  Future<int> insertarUsuario(
    UsuarioModel usuario,
  ) async {

    final Database db =
        await DatabaseHelper.database;
    
          await db.delete(
        'usuarios',
      );

    return await db.insert(
      'usuarios',
      usuario.toMap(),
    );
  }
  Future<int> actualizarUsuario(
    UsuarioModel usuario,
  ) async {

    final Database db =
        await DatabaseHelper.database;

    return await db.update(
      'usuarios',
      usuario.toMap(),
      where: 'id = ?',
      whereArgs: [
        usuario.id,
      ],
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

  Future<UsuarioModel?> obtenerPrimerUsuario() async {

    final Database db =
        await DatabaseHelper.database;

    final resultado =
        await db.query(
          'usuarios',
          limit: 1,
        );

    if (resultado.isEmpty) {
      return null;
    }

    return UsuarioModel.fromMap(
      resultado.first,
    );
  }
}