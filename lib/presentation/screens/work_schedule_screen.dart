import 'package:flutter/material.dart';
import '../widgets/day_card.dart';

class WorkScheduleScreen extends StatelessWidget {

  final int semanaId;

  const WorkScheduleScreen({
    super.key,
    required this.semanaId,
  });

  @override
  Widget build(BuildContext context) {

    final dias = [
      {"numero": 1, "nombre": "Lunes"},
      {"numero": 2, "nombre": "Martes"},
      {"numero": 3, "nombre": "Miércoles"},
      {"numero": 4, "nombre": "Jueves"},
      {"numero": 5, "nombre": "Viernes"},
      {"numero": 6, "nombre": "Sábado"},
      {"numero": 7, "nombre": "Domingo"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Horario laboral"),
      ),
      body: ListView.builder(
        itemCount: dias.length,
        itemBuilder: (context, index) {

          return DayCard(
            semanaId: semanaId,
            numeroDia: dias[index]["numero"] as int,
            nombreDia: dias[index]["nombre"] as String,
          );
        },
      ),
    );
  }
}