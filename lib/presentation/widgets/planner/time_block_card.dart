import 'package:flutter/material.dart';
import 'package:misemana_plus/core/planner/time_block.dart';
import 'package:misemana_plus/core/planner/utils/time_utils.dart';
import 'package:misemana_plus/core/planner/utils/current_time_utils.dart';

import 'block_color_helper.dart';
import 'block_name_helper.dart';
import 'block_icon_helper.dart';

class TimeBlockCard extends StatelessWidget {

  final TimeBlock block;

  const TimeBlockCard({
    super.key,
    required this.block,
  });

  @override
  Widget build(BuildContext context) {

    final isCurrent =
    CurrentTimeUtils.isCurrentBlock(
      block.start,
      block.end,
    );
    return Card(

      color: isCurrent
    ? const Color.fromARGB(255, 255, 60, 0)
    : BlockColorHelper.getColor(block.type),

        elevation: isCurrent
      ? 8
      : 2,

        shadowColor: isCurrent
      ? Colors.black87
      : Colors.black26,

      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),

      side: BorderSide(
        color: isCurrent
          ? Colors.black87
          : Colors.transparent,

      width: isCurrent
          ? 3
          : 0,  
      ),
    ),

      child: Padding(

        padding: const EdgeInsets.all(12),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,
        children: [
          Row(
            children: [

            Icon(
              BlockIconHelper.getIcon(block.type),
              color: Colors.white,
            ),

            const SizedBox(width: 8),

            Text(
              BlockNameHelper.getName(block.type),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),

            const SizedBox(height: 4),

            Text(
              "${TimeUtils.fromMinutes(block.start)} - ${TimeUtils.fromMinutes(block.end)}",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),

          ],
        ),
      ),
    );
  }
}