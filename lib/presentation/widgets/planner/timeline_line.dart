import 'package:flutter/material.dart';
import 'package:misemana_plus/presentation/widgets/planner/block_color_helper.dart';

class TimelineLine extends StatelessWidget {

  final String type;

  const TimelineLine({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {

    final color = BlockColorHelper.getColor(type);

    return SizedBox(
      width: 40,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: 2,
              color: Colors.grey.shade400,
            ),
          ),

          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border:

                  Border.all(
                    color: Colors.black26,
                    width: 1,
                  ),
            ),
          ),

          Expanded(
            child: Container(
              width: 2,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}