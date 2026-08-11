import 'package:flutter/material.dart';

import '../../data/models/semana_model.dart';
import '../../core/planner/utils/week_utils.dart';

class PlanningWeekCard extends StatelessWidget {

  final SemanaModel semana;
  final bool isCurrent;
  final VoidCallback onTap;

  const PlanningWeekCard({
    super.key,
    required this.semana,
    required this.isCurrent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final start =
        WeekUtils.getStartOfWeekNumber(
      semana.numeroSemana,
      semana.anio,
    );

    final end =
        WeekUtils.getEndOfWeekNumber(
      semana.numeroSemana,
      semana.anio,
    );

    return Card(

      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      elevation:
          isCurrent ? 5 : 2,

      shape: RoundedRectangleBorder(

        borderRadius:
            BorderRadius.circular(16),

        side: BorderSide(

          color: isCurrent
              ? Colors.blue.shade800
              : Colors.transparent,

          width:
              isCurrent ? 2 : 0,
        ),
      ),

      child: InkWell(

        borderRadius:
            BorderRadius.circular(16),

        onTap: onTap,

        child: Padding(

          padding:
              const EdgeInsets.all(16),

          child: Row(

            children: [

              Container(

                padding:
                    const EdgeInsets.all(12),

                decoration: BoxDecoration(

                  color:
                      Colors.blue.shade50,

                  borderRadius:
                      BorderRadius.circular(12),
                ),

                child: Icon(

                  Icons.calendar_month,

                  color:
                      Colors.blue.shade800,

                  size: 28,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Row(

                      children: [

                        Text(

                          "Semana ${semana.numeroSemana}",

                          style:
                              const TextStyle(

                            fontSize: 18,

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        if (isCurrent) ...[

                          const SizedBox(width: 8),

                          Container(

                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),

                            decoration:
                                BoxDecoration(

                              color:
                                  Colors.blue.shade800,

                              borderRadius:
                                  BorderRadius.circular(10),
                            ),

                            child: const Text(

                              "ACTUAL",

                              style:
                                  TextStyle(

                                color:
                                    Colors.white,

                                fontSize: 10,

                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),

                    const SizedBox(height: 6),

                    Text(
                      "${semana.anio}",
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),

                    const SizedBox(height: 6),

                      Text(
                        "${WeekUtils.formatDate(start)} "
                        "- ${WeekUtils.formatDate(end)}",

                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 8),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),

                          decoration: BoxDecoration(
                            color: semana.estado == "Vacaciones"
                                ? Colors.orange.shade100
                                : Colors.blue.shade100,

                            borderRadius:
                                BorderRadius.circular(10),
                          ),

                          child: Text(
                            semana.estado == "Normal"
                              ? "Semana normal"
                              : semana.estado,
                            style: TextStyle(
                              color: semana.estado == "Vacaciones"
                                  ? Colors.orange.shade900
                                  : Colors.blue.shade900,

                              fontSize: 11,

                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                  ],
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}