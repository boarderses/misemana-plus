import 'package:flutter/material.dart';
import '../widgets/objective_counter_card.dart';
import '../../data/models/objetivo_model.dart';
import '../../data/repositories/objetivo_repository.dart';
import '../../core/planner/constants/objective_types.dart';
import 'planner_debug_screen.dart';

class WeeklyObjectivesScreen extends StatefulWidget {

  final int semanaId;

  const WeeklyObjectivesScreen({
    super.key,
    required this.semanaId,
  });

  @override
  State<WeeklyObjectivesScreen> createState() =>
      _WeeklyObjectivesScreenState();
}

class _WeeklyObjectivesScreenState
    extends State<WeeklyObjectivesScreen> {

  int estudio = 10;
  int deporte = 3;
  int alimentacion = 7;
  int ocio = 8;
  int tiempoPersonal = 5;

  final ObjetivoRepository repository =
    ObjetivoRepository();
  
  Future<void> guardarObjetivos() async {
    
    await repository.eliminarObjetivosSemana(
    widget.semanaId,
    );
    final objetivos = [

    ObjetivoModel(
      semanaId: widget.semanaId,
      tipo: ObjectiveTypes.estudio,
      cantidad: estudio,
    ),

    ObjetivoModel(
      semanaId: widget.semanaId,
      tipo: ObjectiveTypes.deporte,
      cantidad: deporte,
    ),

    ObjetivoModel(
      semanaId: widget.semanaId,
      tipo: ObjectiveTypes.alimentacion,
      cantidad: alimentacion,
    ),

    ObjetivoModel(
      semanaId: widget.semanaId,
      tipo: ObjectiveTypes.ocio,
      cantidad: ocio,
    ),

    ObjetivoModel(
      semanaId: widget.semanaId,
      tipo: ObjectiveTypes.tiempoPersonal,
      cantidad: tiempoPersonal,
    ),

  ];

    for (final objetivo in objetivos) {
      print("Guardando ${objetivo.tipo}");
      await repository.insertarObjetivo(
        objetivo,
     );
   }

  }
  Future<void> cargarObjetivos() async {

  final objetivos =
      await repository.obtenerObjetivosSemana(
    widget.semanaId,
  );

  if (objetivos.isEmpty) return;

  setState(() {

    for (final objetivo in objetivos) {

      switch (objetivo.tipo) {

        case ObjectiveTypes.estudio:
          estudio = objetivo.cantidad;
          break;

        case ObjectiveTypes.deporte:
          deporte = objetivo.cantidad;
          break;

        case ObjectiveTypes.alimentacion:
          alimentacion = objetivo.cantidad;
          break;

        case ObjectiveTypes.ocio:
          ocio = objetivo.cantidad;
          break;

        case ObjectiveTypes.tiempoPersonal:
          tiempoPersonal = objetivo.cantidad;
          break;

      }

    }

  });

}
  @override
  void initState() {
    super.initState();
    cargarObjetivos();
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Objetivos semanales",
        ),
      ),

      body: ListView(
        children: [

          ObjectiveCounterCard(
            titulo: "Estudio",
            icono: Icons.menu_book,
            unidad: "horas",
            valor: estudio,
            onIncrement: () {
              setState(() {
                estudio++;
              });
            },
            onDecrement: () {
              if (estudio == 0) return;

              setState(() {
                estudio--;
              });
            },
          ),

          ObjectiveCounterCard(
            titulo: "Deporte",
            icono: Icons.fitness_center,
            unidad: "días",
            valor: deporte,
            onIncrement: () {
              setState(() {
                deporte++;
              });
            },
            onDecrement: () {
              if (deporte == 0) return;

              setState(() {
                deporte--;
              });
            },
          ),

          ObjectiveCounterCard(
            titulo: "Alimentación",
            icono: Icons.restaurant,
            unidad: "horas",
            valor: alimentacion,
            onIncrement: () {
              setState(() {
                alimentacion++;
              });
            },
            onDecrement: () {
              if (alimentacion == 0) return;

              setState(() {
                alimentacion--;
              });
            },
          ),

          ObjectiveCounterCard(
            titulo: "Ocio",
            icono: Icons.sports_esports,
            unidad: "horas",
            valor: ocio,
            onIncrement: () {
              setState(() {
                ocio++;
              });
            },
            onDecrement: () {
              if (ocio == 0) return;

              setState(() {
                ocio--;
              });
            },
          ),

          ObjectiveCounterCard(
            titulo: "Tiempo personal",
            icono: Icons.self_improvement,
            unidad: "horas",
            valor: tiempoPersonal,
            onIncrement: () {
              setState(() {
                tiempoPersonal++;
              });
            },
            onDecrement: () {
              if (tiempoPersonal == 0) return;

              setState(() {
                tiempoPersonal--;
              });
            },
          ),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: ElevatedButton(
              onPressed: () async {

                await guardarObjetivos();

                if (!mounted) return;

                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlannerDebugScreen(
                    semanaId: widget.semanaId,
                    ),
                 ),
                );
                
              },
              child: const Text(
                "Guardar objetivos",
              ),
            ),
          ),

          const SizedBox(height: 24),

        ],
      ),
    );
  }
}