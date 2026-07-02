import '../../domain/entities/semana.dart';

class SemanaModel extends Semana {
  SemanaModel({
    super.id,
    required super.usuarioId,
    required super.numeroSemana,
    required super.anio,
    required super.estado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'numeroSemana': numeroSemana,
      'anio': anio,
      'estado': estado,
    };
  }

  factory SemanaModel.fromMap(Map<String, dynamic> map) {
    return SemanaModel(
      id: map['id'],
      usuarioId: map['usuarioId'],
      numeroSemana: map['numeroSemana'],
      anio: map['anio'],
      estado: map['estado'],
    );
  }
}