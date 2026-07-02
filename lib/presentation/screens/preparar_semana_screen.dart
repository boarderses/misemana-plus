import 'package:flutter/material.dart';

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
              onPressed: () {

              },
              child: const Text(
                "Continuar",
              ),
            )

          ],
        ),
      ),
    );
  }
}