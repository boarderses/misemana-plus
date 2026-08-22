import 'package:flutter/material.dart';
import '../../data/models/semana_model.dart';
import '../../data/repositories/semana_repository.dart';
import 'work_schedule_screen.dart';
import '../../core/planner/services/semana_service.dart';
import '../../core/planner/utils/week_utils.dart';

class PrepararSemanaScreen extends StatefulWidget {
  const PrepararSemanaScreen({super.key});

  @override
  State<PrepararSemanaScreen> createState() =>
      _PrepararSemanaScreenState();
}

class _PrepararSemanaScreenState
    extends State<PrepararSemanaScreen> {

  final numeroSemanaController =
      TextEditingController();

  final anioController =
      TextEditingController();
  
  final SemanaRepository repository =
    SemanaRepository();

  final SemanaService semanaService =
    SemanaService();

  bool copiarSemanaAnterior = false;
  bool vacaciones = false;

  @override
  void initState() {
    super.initState();

    final siguiente =
        WeekUtils.getNextWeek();

    numeroSemanaController.text =
        siguiente['semana'].toString();

    anioController.text =
        siguiente['anio'].toString();
  }

  @override
  void dispose() {
    numeroSemanaController.dispose();
    anioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Preparar nueva semana"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            TextField(
              controller: numeroSemanaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Número de semana",
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: anioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Año",
              ),
            ),

            const SizedBox(height: 20),

            CheckboxListTile(
              title: const Text(
                "Copiar semana anterior",
              ),
              value: copiarSemanaAnterior,
              onChanged: (value) {
                setState(() {
                  copiarSemanaAnterior =
                      value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text(
                "Semana de vacaciones",
              ),
              value: vacaciones,
              onChanged: (value) {
                setState(() {
                  vacaciones = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {

                final semana = SemanaModel(
                  usuarioId: 1,
                  numeroSemana:
                      int.parse(numeroSemanaController.text),
                  anio:
                      int.parse(anioController.text),
                  estado:
                      vacaciones ? "Vacaciones" : "Normal",
                );

                final semanaExistente =
                    await repository.obtenerSemana(
                  semana.usuarioId,
                  semana.numeroSemana,
                  semana.anio,
                );

                int semanaId;

                if (semanaExistente != null) {

                  semanaId = semanaExistente.id!;

                } else {

                  semanaId =
                      await repository.insertarSemana(semana);
                }

                if (copiarSemanaAnterior) {

                  final semanaCreada =
                      await semanaService.obtenerSemanaPorId(
                    semanaId,
                  );

                  if (semanaCreada != null) {

                    final copiada =
                        await semanaService.copiarSemanaAnterior(
                      semanaCreada,
                    );

                    if (!copiada && mounted) {

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            "No se encontró una semana anterior para copiar",
                          ),
                        ),
                      );
                    }
                  }
                }

                if (!mounted) return;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WorkScheduleScreen(
                      semanaId: semanaId,
                    ),
                  ),
                );
              },
              child: const Text("Continuar"),
            )
          ],
        ),
      ),
    );
  }
}