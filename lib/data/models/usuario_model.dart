import '../../domain/entities/usuario.dart';

class UsuarioModel extends Usuario {
  UsuarioModel({
    super.id,
    required super.nombre,
    required super.horaDormir,
    required super.horaDespertar,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'horaDormir': horaDormir,
      'horaDespertar': horaDespertar,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'],
      nombre: map['nombre'],
      horaDormir: map['horaDormir'],
      horaDespertar: map['horaDespertar'],
    );
  }
}