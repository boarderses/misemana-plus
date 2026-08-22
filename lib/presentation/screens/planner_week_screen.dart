import 'package:flutter/material.dart';

import '../../../core/planner/services/planner_service.dart';
import '../../../core/planner/planner_week.dart';
import 'package:misemana_plus/presentation/widgets/planner/day_column.dart';
import '../../core/planner/utils/date_utils.dart';
import '../../core/planner/utils/week_utils.dart';
import '../../../core/planner/planner_day.dart';
import '../../../core/planner/services/semana_service.dart';
import '../../../data/models/semana_model.dart';


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
    with SingleTickerProviderStateMixin {

  final PlannerService plannerService =
      PlannerService();

  final SemanaService semanaService =
      SemanaService();

  late Future<SemanaModel?> futureSemana;
  late Future<PlannerWeek> futureWeek;
  SemanaModel? semanaSeleccionada;

  TabController? tabController;

  int initialDay = 0;

  final days = PlannerDay.days;


  @override
  void initState() {

    super.initState();

    futureSemana =
        semanaService.obtenerSemanaPorId(
      widget.semanaId,
    );

    cargarSemana();

    prepararTabController();
  }


  void cargarSemana() {

    futureWeek =
        plannerService.generate(
      widget.semanaId,
    );
  }


  Future<void> prepararTabController() async {

    final semana =
        await futureSemana;

    if (!mounted) {
      return;
    }

    semanaSeleccionada = semana;

    if (semana == null) {

      initialDay = 0;

    } else {

      final now =
          DateTime.now();

      final currentWeek =
          WeekUtils.getWeekNumber(now);

      final isCurrentWeek =
          semana.numeroSemana ==
              currentWeek &&
          semana.anio ==
              now.year;

      if (isCurrentWeek) {

        final today =
            PlannerDateUtils.getCurrentDay();

        initialDay =
            today - 1;

      } else {

        initialDay = 0;

      }
    }

    tabController =
        TabController(
      length: days.length,
      initialIndex: initialDay,
      vsync: this,
    );

    setState(() {});
  }


  @override
  void dispose() {

    tabController?.dispose();
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
                fontWeight:
                    FontWeight.bold,
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
            icon: const Icon(Icons.home),
            tooltip: "Inicio",
            onPressed: () {
              Navigator.popUntil(
                context,
                (route) => route.isFirst,
              );
            },
          ),

          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: "Actualizar planificación",
            onPressed: () {
              setState(() {
                cargarSemana();
              });
            },
          ),
        ],

      
        bottom:

            tabController == null

                ? null

                : TabBar(

                    controller:
                        tabController,

                    isScrollable:
                        true,

                    tabs:
                        days.map(

                      (day) => Tab(

                        text:
                            day.name
                                .substring(0, 3),

                      ),

                    ).toList(),
                  ),
      ),


      body: Column(

        children: [

          FutureBuilder<SemanaModel?>(

            future: futureSemana,

            builder:
                (context, snapshot) {

              if (snapshot.connectionState ==
                  ConnectionState.waiting) {

                return const Padding(

                  padding:
                      EdgeInsets.all(12),

                  child:
                      LinearProgressIndicator(),
                );
              }


              final semana = snapshot.data;

              if (semana == null) {

                return const Padding(

                  padding:
                      EdgeInsets.all(12),

                  child: Text(
                    "Semana no encontrada",
                  ),
                );
              }


              final start =
                  WeekUtils
                      .getStartOfWeekNumber(
                semana.numeroSemana,
                semana.anio,
              );


              final end =
                  WeekUtils
                      .getEndOfWeekNumber(
                semana.numeroSemana,
                semana.anio,
              );


              return Container(

                padding:
                    const EdgeInsets.all(12),

                alignment:
                    Alignment.centerLeft,

                child: Text(

                  "Semana "
                  "${semana.numeroSemana}\n"
                  "Del "
                  "${WeekUtils.formatDate(start)}"
                  " - "
                  "${WeekUtils.formatDate(end)}",

                  style:
                      const TextStyle(

                    fontSize: 16,

                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              );
            },
          ),


          Expanded(

            child:
                FutureBuilder<PlannerWeek>(

              future: futureWeek,

              builder:
                  (context, snapshot) {

                if (snapshot.connectionState ==
                    ConnectionState.waiting) {

                  return const Center(

                    child:
                        CircularProgressIndicator(),
                  );
                }


                if (!snapshot.hasData) {

                  return const Center(

                    child: Text(
                      "No hay planificación disponible",
                    ),
                  );
                }


                if (tabController == null||
                    semanaSeleccionada == null) {

                  return const Center(

                    child:
                        CircularProgressIndicator(),
                  );
                }


                final week =
                    snapshot.data!;


                return TabBarView(

                  controller:
                      tabController,

                  children:
                      List.generate(

                    days.length,

                    (index) {

                      return DayColumn(

                        dayName:
                            days[index].name,

                        dayNumber:
                            days[index].number,

                        weekNumber: semanaSeleccionada!.numeroSemana,
                          year: semanaSeleccionada!.anio,

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