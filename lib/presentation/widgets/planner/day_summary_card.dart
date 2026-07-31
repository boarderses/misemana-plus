import 'package:flutter/material.dart';
import '../../../core/planner/time_block.dart';
import '../../../core/planner/constants/block_types.dart';


class DaySummaryCard extends StatelessWidget {

  final List<TimeBlock> blocks;

  const DaySummaryCard({
    super.key,
    required this.blocks,
  });

  int get totalMinutes {

  const excludedTypes = {

    BlockTypes.sleep,
    BlockTypes.work,
    BlockTypes.food,
    BlockTypes.free,

  };
  
  return blocks
      .where(
        (block) =>
            !excludedTypes.contains(
              block.type,
            ),
      )
      .fold<int>(
        0,
        (sum, block) =>
            sum + block.duration,
      );
}

  String get formattedHours {

    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;

    if(minutes == 0){

      return "${hours}h";
    }

    return "${hours}h ${minutes}min";

  }

  @override
  Widget build(BuildContext context) {

    return Card(

      margin:
          const EdgeInsets.only(
            bottom: 12,
          ),

      elevation: 3,

      shape:
          RoundedRectangleBorder(

            borderRadius:
                BorderRadius.circular(14),
          ),

      child: Padding(

        padding:
            const EdgeInsets.all(12),

        child: Row(

          children: [

            Expanded(

              child: _SummaryItem(

                icon:
                    Icons.view_agenda,

                title:
                    "Bloques",

                value:
                    blocks.length.toString(),

              ),
            ),

            Expanded(

              child: _SummaryItem(

                icon:
                    Icons.schedule,

                title:
                    "Objetivos",

                value:
                    formattedHours,

              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {

  final IconData icon;
  final String title;
  final String value;

  const _SummaryItem({

    required this.icon,
    required this.title,
    required this.value,

  });

  @override
  Widget build(BuildContext context) {


    return Row(

      children: [

        Icon(
          icon,
          size: 28,
        ),

        const SizedBox(
          width: 8,
        ),

        Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

           Text(

              title,
              style:
                  const TextStyle(
                    fontSize: 12,
                  ),

            ),

            Text(

              value,
              style:
                  const TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
            ),
          ],
        ),

      ],
    );
  }
}