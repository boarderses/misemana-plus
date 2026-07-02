import 'package:flutter/material.dart';

class Turno {
  final int? id;
  final int semanaId;
  final int dia;
  final String horaInicio;
  final String horaFin;

  Turno({
    this.id,
    required this.semanaId,
    required this.dia,
    required this.horaInicio,
    required this.horaFin,
  });

  Duration obtenerDuracion() {

  final inicio = TimeOfDay(
    hour: int.parse(horaInicio.split(":")[0]),
    minute: int.parse(horaInicio.split(":")[1]),
  );

  final fin = TimeOfDay(
    hour: int.parse(horaFin.split(":")[0]),
    minute: int.parse(horaFin.split(":")[1]),
  );

  int minutosInicio =
      inicio.hour * 60 + inicio.minute;

  int minutosFin =
      fin.hour * 60 + fin.minute;

  if (minutosFin < minutosInicio) {
    minutosFin += 24 * 60;
  }

  return Duration(
    minutes: minutosFin - minutosInicio,
  );
}
}