import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String nombre;
  final String horaDormir;
  final String horaDespertar;

  const HomeScreen({
    super.key,
    required this.nombre,
    required this.horaDormir,
    required this.horaDespertar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MiSemana+"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              "¡Hola, $nombre!",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Hora de dormir",
            ),

            Text(
              horaDormir,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Hora de despertar",
            ),

            Text(
              horaDespertar,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Generar planificación semanal",
              ),
            ),
          ],
        ),
      ),
    );
  }
}