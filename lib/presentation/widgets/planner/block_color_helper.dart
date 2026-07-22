import 'package:flutter/material.dart';
import 'package:misemana_plus/core/planner/constants/block_types.dart';

class BlockColorHelper {

  static Color getColor(String type) {

    switch (type) {

      case BlockTypes.sleep:
        return Colors.indigo;

      case BlockTypes.work:
        return Colors.blue;

      case BlockTypes.study:
        return Colors.green;

      case BlockTypes.sport:
        return Colors.red;

      case BlockTypes.food:
        return Colors.orange;

      case BlockTypes.leisure:
        return Colors.purple;

      case BlockTypes.personal:
        return Colors.teal;

      case BlockTypes.free:
        return Colors.grey.shade300;

      default:
        return Colors.black12;
    }
  }
}