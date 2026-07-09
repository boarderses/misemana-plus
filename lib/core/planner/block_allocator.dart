import 'package:misemana_plus/core/planner/free_time_analyzer.dart';

import 'time_block.dart';
import 'constants/block_types.dart';
import 'constants/block_priorities.dart';

class BlockAllocator {
    final FreeTimeAnalyzer analyzer = FreeTimeAnalyzer();

    TimeBlock? _findBestBlockInDay(
      List<TimeBlock> blocks,
      int day,
      int minutes,
    ) {

      TimeBlock? bestBlock;
      int bestDuration = 0;

      for (final block in blocks) {
        if (block.day != day){
          continue;
        }

        if (block.type != BlockTypes.free) {
        continue;
      }

      final duration = block.end - block.start;

      if (duration < minutes) {
        continue;
      }

      if (duration > bestDuration) {
        bestDuration = duration;
        bestBlock = block;
      }
    }
    return bestBlock;
  }
    bool allocate(
      List<TimeBlock> blocks,
      int minutes,
      String type,
      int priority,
    ) {

      final days = analyzer.analyze(blocks);
      for (final day in days){
        final freeBlock = _findBestBlockInDay(blocks, day.day, minutes);

      if (freeBlock == null) {
      continue;
    }
  
    final end = freeBlock.start + minutes;

    final activity = TimeBlock(
      day: freeBlock.day,
      start: freeBlock.start,
      end: end,
      type: type,
      priority: priority,
    );

   final remaining = TimeBlock(
      day: freeBlock.day,
      start: end,
      end: freeBlock.end,
      type: BlockTypes.free,
      priority: BlockPriorities.free,
    );
  // Eliminamos el bloque libre original
      blocks.remove(freeBlock);

  // Añadimos la actividad
      blocks.add(activity);

  // Añadimos el tiempo libre restante si queda
    if (remaining.start < remaining.end) {
      blocks.add(remaining);
  }

  // Ordenamos de nuevo la lista
      blocks.sort((a, b) {
        if (a.day != b.day) {
          return a.day.compareTo(b.day);
    }

      return a.start.compareTo(b.start);
    });

    return true;
    }
    return false;
  }
}