import 'package:flutter/material.dart';
import 'package:misemana_plus/data/repositories/turno_repository.dart';
import 'package:misemana_plus/data/models/turno_model.dart';

class DayCard extends StatefulWidget {

  final String nombreDia;
  final int semanaId;
  final int numeroDia;

  const DayCard({
    super.key,
    required this.semanaId,
    required this.numeroDia,
    required this.nombreDia,
  });

  @override
  State<DayCard> createState() => _DayCardState();
}

  class _DayCardState extends State<DayCard> {

    List<String> turnos = [];
    final TurnoRepository repository = TurnoRepository();

  Future<void> cargarTurnos() async {

    final resultado =
        await repository.obtenerTurnosDia(
         widget.semanaId,
         widget.numeroDia,
       ); 

    setState(() {

     turnos = resultado
         .map(
           (e) =>
               "${e.horaInicio} - ${e.horaFin}",
          )
          .toList();

    });
  } 
    @override
    void initState() {
    super.initState();
    cargarTurnos();
  }

  Future<void> _agregarTurno() async {

      final horaInicio = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(
          hour: 8,
          minute: 0,
        ),
      );

      if (horaInicio == null) return;

      final horaFin = await showTimePicker(
        context: context,
        initialTime: horaInicio,
      );

      if (horaFin == null) return;

      final turno = TurnoModel(
        semanaId: widget.semanaId,
        dia: widget.numeroDia,
        horaInicio: horaInicio.format(context),
        horaFin: horaFin.format(context),
      );

        await repository.insertarTurno(turno);
        await cargarTurnos();
  }
      
  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Text(
              "📅 ${widget.nombreDia}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            turnos.isEmpty
              ? const Text("Día libre")
              : Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: turnos
                      .map(
                        (turno) => Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8),
                          child: Text("🕗 $turno"),
                        ),
                     )
                      .toList(),
                ),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _agregarTurno,
                icon: const Icon(Icons.add),
                label: const Text(
                  "Añadir turno",
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}