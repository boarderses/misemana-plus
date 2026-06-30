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
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "👋 Hola, $nombre",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    "😴 Sueño",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text("Dormir: $horaDormir"),
                  Text("Despertar: $horaDespertar"),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Card(
            child: ListTile(
              leading: const Icon(Icons.flag),
              title: const Text("Objetivos"),
              subtitle: const Text(
                "Configura tus metas semanales",
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () {},
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.event_note),
              title: const Text("Actividades"),
              subtitle: const Text(
                "Gestiona tus actividades",
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () {},
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text("Planificación"),
              subtitle: const Text(
                "Generar planificación semanal",
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    ),
  );
}
}