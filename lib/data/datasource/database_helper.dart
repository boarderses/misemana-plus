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
  version: 6,
  onCreate: _onCreate,
  onUpgrade: _onUpgrade,
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
        horaDormir TEXT NOT NULL,
        horaDespertar TEXT NOT NULL
)
    ''');
    await db.execute('''
      CREATE TABLE objetivos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuarioId INTEGER NOT NULL,
        tipo TEXT NOT NULL,
        cantidad INTEGER NOT NULL,
       FOREIGN KEY(usuarioId) REFERENCES usuarios(id)
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

    await db.execute('''
      CREATE TABLE semanas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuarioId INTEGER NOT NULL,
        numeroSemana INTEGER NOT NULL,
        anio INTEGER NOT NULL,
        estado TEXT NOT NULL,
        FOREIGN KEY(usuarioId) REFERENCES usuarios(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE turnos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        semanaId INTEGER NOT NULL,
        dia INTEGER NOT NULL,
        horaInicio TEXT NOT NULL,
        horaFin TEXT NOT NULL,
        FOREIGN KEY(semanaId) REFERENCES semanas(id)
      )
    ''');
  }
  static Future<void> _onUpgrade(
  Database db,
  int oldVersion,
  int newVersion,
  ) async {

  if (oldVersion < 5) {
    await db.execute('''
      CREATE TABLE semanas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuarioId INTEGER NOT NULL,
        numeroSemana INTEGER NOT NULL,
        anio INTEGER NOT NULL,
        estado TEXT NOT NULL,
        FOREIGN KEY(usuarioId) REFERENCES usuarios(id)
      )
    ''');
    }
  if (oldVersion < 6) {
    await db.execute('''
      CREATE TABLE turnos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        semanaId INTEGER NOT NULL,
        dia INTEGER NOT NULL,
        horaInicio TEXT NOT NULL,
        horaFin TEXT NOT NULL,
        FOREIGN KEY(semanaId) REFERENCES semanas(id)
      )
    '''); 
    }
  }
}