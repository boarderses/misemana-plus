import 'package:flutter/material.dart';
import 'package:misemana_plus/presentation/widgets/dashboard_card.dart';
import 'objetivos_screen.dart';
import 'weekly_plan_screen.dart';

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

          DashboardCard(
              icon: Icons.calendar_month,
              titulo: "Preparar semana",
              subtitulo: "Configura una nueva semana",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const PrepararSemanaScreen(),
                 ),
               );
            },
          ),

          DashboardCard(
              icon: Icons.flag,
              titulo: "Objetivos",
              subtitulo: "Configura tus metas semanales",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ObjetivosScreen(),
                  ),
                );
              },
            ),

            DashboardCard(
              icon: Icons.event_note,
              titulo: "Actividades",
              subtitulo: "Gestiona tus actividades",
              onTap: () {},
            ),

            DashboardCard(
              icon: Icons.calendar_month,
              titulo: "Planificación",
              subtitulo: "Generar planificación semanal",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}