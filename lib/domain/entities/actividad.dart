class Actividad {
  final int? id;
  final String nombre;
  final String categoria;
  final int duracion;
  final int prioridad;

  Actividad({
    this.id,
    required this.nombre,
    required this.categoria,
    required this.duracion,
    required this.prioridad,
  });
}