import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String text;
  final Importance importance;
  final DateTime? doUntil;
  final bool done;

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