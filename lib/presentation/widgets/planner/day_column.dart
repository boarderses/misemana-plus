import 'package:flutter/material.dart';
import 'package:misemana_plus/core/planner/time_block.dart';
import 'package:misemana_plus/core/planner/utils/day_date_utils.dart';
import 'package:misemana_plus/core/planner/utils/week_utils.dart';

import 'timeline_item.dart';
import 'day_summary_card.dart';

class DayColumn extends StatelessWidget {

  final String dayName;
  final int dayNumber;
  final int weekNumber;
  final int year;
  final List<TimeBlock> blocks;

  const DayColumn({
    super.key,
    required this.dayName,
    required this.dayNumber,
    required this.weekNumber,
    required this.year,
    required this.blocks,
  });

  bool _isToday(DateTime date) {
  final now = DateTime.now();

  return date.year == now.year &&
      date.month == now.month &&
      date.day == now.day;
}

  @override
  Widget build(BuildContext context) {

    final sortedBlocks = [...blocks]
      ..sort(
        (a, b) => a.start.compareTo(b.start),
      );
    final date =
        WeekUtils.getStartOfWeekNumber(
      weekNumber,
      year,
    ).add(
      Duration(
        days: dayNumber - 1,
      ),
    );

    return Padding(

      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
            
      children: [
      Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,

       children: [
          Text(
              dayName,
              style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),  

            if (_isToday(date))

                Container(

                  padding:
                      const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),

                  decoration:
                      BoxDecoration(

                        color:
                            Colors.black87,

                        borderRadius:
                            BorderRadius.circular(20),
                      ),

                  child: const Text(
                    "HOY",
                    style:
                        TextStyle(

                          color:
                              Colors.white,

                          fontSize:
                              12,

                          fontWeight:
                              FontWeight.bold,
                        ),
                  ),
                ),
            ],
          ),

            Text(
              DayDateUtils.formatDate(date),
              style: TextStyle(
              color: Colors.grey[600],
            ),
          ),

            const SizedBox(
              height: 12,
            ),

            DaySummaryCard(
              blocks: sortedBlocks,
            ),

            const SizedBox(
              height: 8,
            ),
          

          Expanded(           
            child: ListView.builder(
              itemCount: sortedBlocks.length,
              itemBuilder: (context,index){

                return TimelineItem(
                  block: sortedBlocks[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}