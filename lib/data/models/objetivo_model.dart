import '../../domain/entities/objetivo.dart';

class ObjetivoModel extends Objetivo {
  ObjetivoModel({
    super.id,
    required super.usuarioId,
    required super.tipo,
    required super.cantidad,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'tipo': tipo,
      'cantidad': cantidad,
    };
  }

  factory ObjetivoModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return ObjetivoModel(
      id: map['id'],
      usuarioId: map['usuarioId'],
      tipo: map['tipo'],
      cantidad: map['cantidad'],
    );
  }
}