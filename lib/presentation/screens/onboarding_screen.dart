import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {

  final nombreController =
      TextEditingController();

  final dormirController =
      TextEditingController();

  final despertarController =
      TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    dormirController.dispose();
    despertarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("MiSemana+"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: "Nombre",
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: dormirController,
              decoration: const InputDecoration(
                labelText: "Hora de dormir",
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: despertarController,
              decoration: const InputDecoration(
                labelText: "Hora de despertar",
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}