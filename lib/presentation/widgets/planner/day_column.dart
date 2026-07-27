import 'package:flutter/material.dart';
import 'package:misemana_plus/core/planner/time_block.dart';

import 'time_block_card.dart';


class DayColumn extends StatelessWidget {

  final String dayName;
  final List<TimeBlock> blocks;


  const DayColumn({
    super.key,
    required this.dayName,
    required this.blocks,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

       children: [
          Text(
            dayName,

            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          const SizedBox(height: 12),

          Expanded(

            child: ListView.builder(
              itemCount: blocks.length,
              itemBuilder: (context,index){

                return TimeBlockCard(
                  block: blocks[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}