import 'package:misemana_plus/data/repositories/semana_repository.dart';
import 'package:misemana_plus/data/models/semana_model.dart';

class SemanaService {

  final SemanaRepository repository =
      SemanaRepository();

  Future<List<SemanaModel>> obtenerSemanas() async {

    return await repository.obtenerTodas();

  }
  Future<SemanaModel?> obtenerSemanaPorId(
    int id,
  ) async {

    return await repository.obtenerSemanaPorId(id);
  }
}