import 'package:misemana_plus/core/planner/constants/block_types.dart';
import 'constants/block_priorities.dart';
import 'time_block.dart';

class TimeWindowAllocator {

  TimeBlock? findBestBlockInWindow(
    List<TimeBlock> blocks,
    int day,
    int windowStart,
    int windowEnd,
    int duration,
  ) {
      // Busca el mejor bloque libre dentro de una ventana horaria. 
    TimeBlock? bestBlock;
    int bestDuration = 0;

    for (final block in blocks) {

      // Debe ser del día indicado
      if (block.day != day) {
        continue;
      }

      // Debe ser un bloque libre
      if (block.type != BlockTypes.free) {
        continue;
      }

      // Calculamos la parte del bloque que cae dentro de la ventana
      final start =
          block.start > windowStart
              ? block.start
              : windowStart;

      final end =
          block.end < windowEnd
              ? block.end
              : windowEnd;

      final available = end - start;

      // Si no cabe la actividad, descartamos
      if (available < duration) {
        continue;
      }

      // Nos quedamos con el bloque que más espacio tenga
      if (available > bestDuration) {
        bestDuration = available;
        bestBlock = block;
      }
    }

    return bestBlock;
  }
    int _calculateBestStart(
      TimeBlock block,
      int windowStart,
      int windowEnd,
      int idealStart,
      int duration,
    ) {
    final start =
      block.start > windowStart
          ? block.start
          : windowStart;

    final end =
      block.end < windowEnd
          ? block.end
          : windowEnd;

    final latestStart = end - duration;
     if (idealStart < start) {
        return start;
      }

      if (idealStart > latestStart) {
        return latestStart;
      }
      return idealStart;
    }
    bool allocate(
      List<TimeBlock> blocks,
      int day,
      int windowStart,
      int windowEnd,
      int idealStart,
      int duration,
      String type,
      int priority,
    ) {

      final freeBlock = findBestBlockInWindow(
        blocks,
        day,
        windowStart,
        windowEnd,
        duration,
      );

      if (freeBlock == null) {
        return false;
      }

      final start = _calculateBestStart(
        freeBlock,
        windowStart,
        windowEnd,
        idealStart,
        duration,
      );

      final end = start + duration;

      final activity = TimeBlock(
        day: day,
        start: start,
        end: end,
        type: type,
        priority: priority,
      );

      // Parte libre antes de la actividad
      if (freeBlock.start < start) {
        blocks.add(
          TimeBlock(
            day: day,
            start: freeBlock.start,
            end: start,
            type: BlockTypes.free,
            priority: BlockPriorities.free,
          ),
        );
      }

      // Parte libre después de la actividad
      if (end < freeBlock.end) {
        blocks.add(
          TimeBlock(
            day: day,
            start: end,
            end: freeBlock.end,
            type: BlockTypes.free,
            priority: BlockPriorities.free,
          ),
        );
      }

      blocks.remove(freeBlock);

      blocks.add(activity);

      blocks.sort((a, b) {
        if (a.day != b.day) {
          return a.day.compareTo(b.day);
        }
        return a.start.compareTo(b.start);
      });

      return true;
    }
}