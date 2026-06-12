import '../../domain/entities/planificacion.dart';

class PlanificacionModel extends Planificacion {
  PlanificacionModel({
    super.id,
    required super.usuarioId,
    required super.actividadId,
    required super.fechaInicio,
    required super.fechaFin,
    required super.estado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'actividadId': actividadId,
      'fechaInicio': fechaInicio.toIso8601String(),
      'fechaFin': fechaFin.toIso8601String(),
      'estado': estado,
    };
  }

  factory PlanificacionModel.fromMap(Map<String, dynamic> map) {
    return PlanificacionModel(
      id: map['id'],
      usuarioId: map['usuarioId'],
      actividadId: map['actividadId'],
      fechaInicio: DateTime.parse(map['fechaInicio']),
      fechaFin: DateTime.parse(map['fechaFin']),
      estado: map['estado'],
    );
  }
}