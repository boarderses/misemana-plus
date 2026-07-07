class TimeBlock {

  final int day;
  final int start;
  final int end;
  final String type;
  final int priority;

  const TimeBlock({
    required this.day,
    required this.start,
    required this.end,
    required this.type,
    required this.priority,
  });

  int get duration => end - start;

}