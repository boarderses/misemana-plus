import 'time_block.dart';
import 'constants/block_types.dart';
import 'constants/block_priorities.dart';

class BlockAllocator {

    TimeBlock? findFreeBlock(
      List<TimeBlock> blocks,
      int minutes,
    ) {

      for (final block in blocks) {

        if (block.type != BlockTypes.free) {
          continue;
      }

      final duration =
        block.end - block.start;

        if (duration >= minutes) {
        return block;
      }
    }
  return null;
  }
    bool allocate(
      List<TimeBlock> blocks,
      int minutes,
      String type,
      int priority,
    ) {

      final freeBlock = findFreeBlock(blocks,minutes,);

   if (freeBlock == null) {
    return false;
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
}