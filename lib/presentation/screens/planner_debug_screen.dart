import 'package:flutter/material.dart';
import '../../core/planner/free_time_analyzer.dart';
import '../../core/planner/services/planner_service.dart';
import '../../core/planner/time_block.dart';
import '../../core/planner/time_utils.dart';

class PlannerDebugScreen extends StatefulWidget {

  final int semanaId;

  const PlannerDebugScreen({
    super.key,
    required this.semanaId,
  });

  @override
  State<PlannerDebugScreen> createState() =>
      _PlannerDebugScreenState();
}

class _PlannerDebugScreenState
    extends State<PlannerDebugScreen> {

  final PlannerService plannerService =
      PlannerService();

  List<TimeBlock> blocks = [];

  @override
  void initState() {
    super.initState();
    cargar();
  }

  Future<void> cargar() async {

    final resultado =
        await plannerService.generate(
      widget.semanaId,
    );
    final analyzer = FreeTimeAnalyzer();

    final days = analyzer.analyze(resultado);

    for (final day in days) {
      print("Día ${day.day}: ${day.minutes} minutos libres",
    );
  }
    setState(() {
      blocks = resultado;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Planner Debug",
        ),
      ),

      body: ListView.builder(

        itemCount: blocks.length,

        itemBuilder: (context, index) {

          final block = blocks[index];

          return ListTile(

            leading: CircleAvatar(
              child: Text(
                block.day.toString(),
              ),
            ),

            title: Text(block.type),

            subtitle: Text(
              "${TimeUtils.fromMinutes(block.start)} - ${TimeUtils.fromMinutes(block.end)}",
            ),

          );

        },

      ),

    );

  }

}