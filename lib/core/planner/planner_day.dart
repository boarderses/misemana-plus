class PlannerDay {

  final int number;
  final String name;

  const PlannerDay({
    required this.number,
    required this.name,
  });


  static const List<PlannerDay> days = [

    PlannerDay(
      number: 1,
      name: "Lunes",
    ),

    PlannerDay(
      number: 2,
      name: "Martes",
    ),

    PlannerDay(
      number: 3,
      name: "Miércoles",
    ),

    PlannerDay(
      number: 4,
      name: "Jueves",
    ),

    PlannerDay(
      number: 5,
      name: "Viernes",
    ),

    PlannerDay(
      number: 6,
      name: "Sábado",
    ),

    PlannerDay(
      number: 7,
      name: "Domingo",
    ),

  ];


  static PlannerDay fromNumber(
    int number,
  ){

    return days.firstWhere(
      (day) => day.number == number,
    );
  }
}