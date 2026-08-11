import 'package:flutter/material.dart';

import '../../core/planner/services/semana_service.dart';
import '../../data/models/semana_model.dart';
import 'planner_week_screen.dart';
import '../../presentation/widgets/planning_week_card.dart';
import '../../core/planner/utils/week_utils.dart';

class PlanningHistoryScreen extends StatefulWidget {

  const PlanningHistoryScreen({
    super.key,
  });

  @override
  State<PlanningHistoryScreen> createState() =>
      _PlanningHistoryScreenState();

}

class _PlanningHistoryScreenState
    extends State<PlanningHistoryScreen> {

  final SemanaService semanaService =
      SemanaService();

  late Future<List<SemanaModel>>
      futureSemanas;

  @override
  void initState() {

    super.initState();

    futureSemanas =
        semanaService.obtenerSemanas();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Mis planificaciones",
        ),

      ),

      body: FutureBuilder<
          List<SemanaModel>>(

        future: futureSemanas,

        builder:
            (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(

              child:
                  CircularProgressIndicator(),

            );

          }

          if (!snapshot.hasData ||
              snapshot.data!.isEmpty) {

            return const Center(

              child: Text(
                "Todavía no hay planificaciones",
              ),

            );

          }

          final semanas =
              snapshot.data!;

          return ListView.builder(

            itemCount:
                semanas.length,

            itemBuilder:
                (context, index) {

              final semana =
                  semanas[index];

              return PlanningWeekCard(
                semana: semana,
                isCurrent:
                    semana.numeroSemana ==
                        WeekUtils.getWeekNumber(
                          DateTime.now(),
                        ),
                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          PlannerWeekScreen(
                        semanaId: semana.id!,
                      ),
                    ),
                  );

                },
              );
            },
          );
        },
      ),
    );
  }
}