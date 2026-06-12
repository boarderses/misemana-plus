import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final path = join(
      await getDatabasesPath(),
      'misemana.db',
    );

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  static Future<void> _onCreate(
    Database db,
    int version,
  ) async {
    await db.execute('''
      CREATE TABLE usuarios(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE
      )
    ''');

    await db.execute('''
      CREATE TABLE actividades(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        categoria TEXT NOT NULL,
        duracion INTEGER NOT NULL,
        prioridad INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE planificaciones(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuarioId INTEGER,
        actividadId INTEGER,
        fechaInicio TEXT,
        fechaFin TEXT,
        estado TEXT,
        FOREIGN KEY(usuarioId) REFERENCES usuarios(id),
        FOREIGN KEY(actividadId) REFERENCES actividades(id)
      )
    ''');
  }
}