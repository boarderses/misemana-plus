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

    List<TurnoModel> turnos = [];
    final TurnoRepository repository = TurnoRepository();

  Future<void> cargarTurnos() async {

    final resultado =
        await repository.obtenerTurnosDia(
         widget.semanaId,
         widget.numeroDia,
       ); 

    setState(() {

     turnos = resultado;
     
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
        horaInicio: "${horaInicio.hour.toString().padLeft(2, '0')}:${horaInicio.minute.toString().padLeft(2, '0')}",
        horaFin: "${horaFin.hour.toString().padLeft(2, '0')}:${horaFin.minute.toString().padLeft(2, '0')}",
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
                crossAxisAlignment: CrossAxisAlignment.start,  
                  children: turnos

                   .map(   
                    (turno) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.work),
                    title: Text(
                      "${turno.horaInicio} - ${turno.horaFin}",
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                    ),
                    onPressed: () async {

                    final confirmar = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                      title: const Text("Eliminar turno"),
                      content: Text(
                    "¿Quieres eliminar el turno de ${turno.horaInicio} a ${turno.horaFin}?",
                    ),
                    actions: [

                     TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text("Cancelar"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    child: const Text("Eliminar"),
                ),
              ],
            ),
          );
                if (confirmar != true) return;

                    await repository.eliminarTurno(turno.id!);
                    await cargarTurnos();
                  },
                 ),
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