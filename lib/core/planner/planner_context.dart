import 'package:misemana_plus/domain/entities/usuario.dart';
import '../../domain/entities/objetivo.dart';
import '../../domain/entities/turno.dart';

class PlannerContext {

  final Usuario usuario;
  final List<Turno> turnos;
  final List<Objetivo> objetivos;

  PlannerContext({
    required this.usuario,
    required this.turnos,
    required this.objetivos,
  });

}