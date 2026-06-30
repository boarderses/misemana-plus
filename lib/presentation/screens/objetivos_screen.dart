import 'package:flutter/material.dart';

class ObjetivosScreen extends StatefulWidget {
  const ObjetivosScreen({super.key});

  @override
  State<ObjetivosScreen> createState() =>
      _ObjetivosScreenState();
}

class _ObjetivosScreenState
    extends State<ObjetivosScreen> {

  final estudioController =
      TextEditingController();

  final deporteController =
      TextEditingController();

  final ocioController =
      TextEditingController();

  @override
  void dispose() {
    estudioController.dispose();
    deporteController.dispose();
    ocioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Objetivos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: estudioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText:
                    "Horas de estudio por semana",
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: deporteController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText:
                    "Días de deporte por semana",
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: ocioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText:
                    "Horas de ocio por semana",
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Guardar"),
            )

          ],
        ),
      ),
    );
  }
}