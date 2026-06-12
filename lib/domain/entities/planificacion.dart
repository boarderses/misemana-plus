class Planificacion {
  final int? id;
  final int usuarioId;
  final int actividadId;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final String estado;

  Planificacion({
    this.id,
    required this.usuarioId,
    required this.actividadId,
    required this.fechaInicio,
    required this.fechaFin,
    required this.estado,
  });
}