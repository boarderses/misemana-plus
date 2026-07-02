import '../../domain/entities/turno.dart';

class TurnoModel extends Turno {

  TurnoModel({
    super.id,
    required super.semanaId,
    required super.dia,
    required super.horaInicio,
    required super.horaFin,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'semanaId': semanaId,
      'dia': dia,
      'horaInicio': horaInicio,
      'horaFin': horaFin,
    };
  }

  factory TurnoModel.fromMap(
      Map<String, dynamic> map) {

    return TurnoModel(
      id: map['id'],
      semanaId: map['semanaId'],
      dia: map['dia'],
      horaInicio: map['horaInicio'],
      horaFin: map['horaFin'],
    );
  }
}