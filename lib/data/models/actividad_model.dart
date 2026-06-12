import '../../domain/entities/actividad.dart';

class ActividadModel extends Actividad {
  ActividadModel({
    super.id,
    required super.nombre,
    required super.categoria,
    required super.duracion,
    required super.prioridad,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'categoria': categoria,
      'duracion': duracion,
      'prioridad': prioridad,
    };
  }

  factory ActividadModel.fromMap(Map<String, dynamic> map) {
    return ActividadModel(
      id: map['id'],
      nombre: map['nombre'],
      categoria: map['categoria'],
      duracion: map['duracion'],
      prioridad: map['prioridad'],
    );
  }
}