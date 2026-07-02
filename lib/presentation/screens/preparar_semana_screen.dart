import 'package:flutter/material.dart';
import '../../data/models/semana_model.dart';
import '../../data/repositories/semana_repository.dart';
import 'work_schedule_screen.dart';

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

  bool copiarSemanaAnterior = false;
  bool vacaciones = false;

  @override
  void initState() {
    super.initState();

    numeroSemanaController.text = "31";
    anioController.text = "2026";
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

                final semanaId =
                    await repository.insertarSemana(semana);

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