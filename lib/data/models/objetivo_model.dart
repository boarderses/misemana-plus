import '../../domain/entities/objetivo.dart';

class ObjetivoModel extends Objetivo {
  ObjetivoModel({
    super.id,
    required super.semanaId,
    required super.tipo,
    required super.cantidad,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'semanaId': semanaId,
      'tipo': tipo,
      'cantidad': cantidad,
    };
  }

  factory ObjetivoModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return ObjetivoModel(
      id: map['id'],
      semanaId: map['semanaId'],
      tipo: map['tipo'],
      cantidad: map['cantidad'],
    );
  }
}