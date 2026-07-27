import 'package:flutter/material.dart';

import '../../../core/planner/services/planner_service.dart';
import '../../../core/planner/planner_week.dart';
import 'package:misemana_plus/presentation/widgets/planner/day_column.dart';

class PlannerWeekScreen extends StatefulWidget {

  final int semanaId;
  const PlannerWeekScreen({
    super.key,
    required this.semanaId,
  });

  @override
  State<PlannerWeekScreen> createState() =>
      _PlannerWeekScreenState();

}
class _PlannerWeekScreenState
    extends State<PlannerWeekScreen> {

  final PlannerService plannerService =
      PlannerService();

  late Future<PlannerWeek> futureWeek;

  @override
  void initState() {

    super.initState();

    futureWeek =
        plannerService.generate(
          widget.semanaId,
        );

  }

  final List<String> days = [

    "Lunes",
    "Martes",
    "Miércoles",
    "Jueves",
    "Viernes",
    "Sábado",
    "Domingo",

  ];

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(

      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Mi planificación",
          ),
          bottom: TabBar(

            isScrollable: true,
            tabs: days.map(

              (day) => Tab(
                text: day.substring(0,3),
              ),

            ).toList(),
          ),
        ),

        body: FutureBuilder<PlannerWeek>(

          future: futureWeek,

          builder: (context,snapshot){

            if(snapshot.connectionState ==
                ConnectionState.waiting){

              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(!snapshot.hasData){

              return const Center(
                child: Text(
                  "No hay planificación disponible",
                ),
              );

            }

           final week =
                snapshot.data!;

            return TabBarView(
              children: List.generate(
                7,
                (index){
                  final dayNumber =
                      index + 1;

                  return DayColumn(

                    dayName:
                        days[index],

                    blocks:
                        week.blocksForDay(
                          dayNumber,
                        ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}