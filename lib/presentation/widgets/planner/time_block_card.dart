import 'package:flutter/material.dart';
import 'package:misemana_plus/core/planner/time_block.dart';
import 'package:misemana_plus/core/planner/time_utils.dart';

import 'block_color_helper.dart';

class TimeBlockCard extends StatelessWidget {

  final TimeBlock block;

  const TimeBlockCard({
    super.key,
    required this.block,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      color: BlockColorHelper.getColor(block.type),

      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      child: Padding(

        padding: const EdgeInsets.all(12),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(
              block.type,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
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