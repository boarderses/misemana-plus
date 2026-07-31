import 'package:flutter/material.dart';

import '../../../core/planner/services/planner_service.dart';
import '../../../core/planner/planner_week.dart';
import 'package:misemana_plus/presentation/widgets/planner/day_column.dart';
import '../../core/planner/utils/date_utils.dart';
import '../../core/planner/utils/week_utils.dart';
import '../../../core/planner/planner_day.dart';

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
    extends State<PlannerWeekScreen>
    with SingleTickerProviderStateMixin  {

  final PlannerService plannerService =
      PlannerService();

  late Future<PlannerWeek> futureWeek;
  late TabController tabController;

  int initialDay = 0;

  final days = PlannerDay.days;

  @override
  void initState() {

    super.initState();

    final today = PlannerDateUtils.getCurrentDay();

    initialDay = today - 1;

    tabController = TabController(
      length: days.length,
      initialIndex: initialDay,
      vsync: this,
    );
    cargarSemana();
  }
   void cargarSemana(){

    futureWeek =
        plannerService.generate(
          widget.semanaId,
        );
  }

  @override
  void dispose() {

    tabController.dispose();

    super.dispose();
  }

    @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

        children: const [

          Text(
            "MiSemana+",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            "Mi planificación semanal",
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),

        actions: [

          IconButton(
            icon: const Icon(
              Icons.refresh,
            ),

            onPressed: (){
              setState(() {
                cargarSemana();
              });
            },
          ),
        ],
        bottom: TabBar(

          controller: tabController,
          isScrollable: true,
          tabs: days.map(
            (day) => Tab(
              text: day.name.substring(0,3),
            ),
          ).toList(),
        ),
      ),

      body: Column (children: [
      Container(
        padding:
            const EdgeInsets.all(12),
        alignment:
            Alignment.centerLeft,

        child: Text(
          WeekUtils.getCurrentWeekText(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),

      Expanded(

      child: FutureBuilder<PlannerWeek>(

        future: futureWeek,
        builder: (context,snapshot){

          if(snapshot.connectionState ==
              ConnectionState.waiting){

            return const Center(
              child:
                  CircularProgressIndicator(),
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

            controller: tabController,
            children: List.generate(
              days.length,

              (index){

                return DayColumn(
                  dayName:
                      days[index].name,
                  dayNumber:
                      days[index].number,
                  blocks:
                      week.blocksForDay(
                        days[index].number,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}