import 'package:flutter/material.dart';

import '../../../core/planner/time_block.dart';
import '../../../core/planner/utils/time_utils.dart';

import 'timeline_line.dart';
import 'time_block_card.dart';

class TimelineItem extends StatelessWidget {
  final TimeBlock block;

  const TimelineItem({
    super.key,
    required this.block,
  });

  @override
  Widget build(BuildContext context) {

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          SizedBox(

            width: 55,

            child: Padding(

              padding:
                  const EdgeInsets.only(
                    top: 16,
                  ),

              child: Text(

                TimeUtils.fromMinutes(
                  block.start,
                ),

                textAlign:
                    TextAlign.right,

                style: TextStyle(

                  fontSize: 13,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(
            width: 8,
          ),

          TimelineLine(type: block.type),

          Expanded(

            child: TimeBlockCard(
              block: block,

            ),
          ),
        ],
      ),
    );
  }
}