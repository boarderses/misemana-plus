import 'package:flutter/material.dart';
import 'package:misemana_plus/core/planner/constants/block_types.dart';

class BlockIconHelper {

  static IconData getIcon(String type) {

    switch(type) {

      case BlockTypes.sleep:
        return Icons.bedtime;

      case BlockTypes.work:
        return Icons.work;

      case BlockTypes.food:
        return Icons.restaurant;

      case BlockTypes.study:
        return Icons.menu_book;

      case BlockTypes.sport:
        return Icons.fitness_center;

      case BlockTypes.leisure:
        return Icons.sports_esports;

      case BlockTypes.personal:
        return Icons.self_improvement;

      case BlockTypes.free:
        return Icons.access_time;

      default:
        return Icons.event;
    }
  }
}