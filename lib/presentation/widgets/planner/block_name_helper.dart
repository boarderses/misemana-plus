import 'package:misemana_plus/core/planner/constants/block_types.dart';

class BlockNameHelper {

  static String getName(String type) {

    switch (type) {

      case BlockTypes.sleep:
        return 'Dormir';

      case BlockTypes.work:
        return 'Trabajo';

      case BlockTypes.food:
        return 'Comida';

      case BlockTypes.study:
        return 'Estudio';

      case BlockTypes.sport:
        return 'Deporte';

      case BlockTypes.leisure:
        return 'Ocio';

      case BlockTypes.personal:
        return 'Tiempo personal';

      case BlockTypes.free:
        return 'Tiempo libre';

      default:
        return type;
    }
  }
}