class Task {
  String id;
  String text;
  Importance importance;
  DateTime? doUntil;
  bool done;

  Task({
    required this.id,
    required this.text,
    required this.importance,
    required this.doUntil,
    required this.done,
  });
}

enum Importance {
  none,
  low,
  high
}