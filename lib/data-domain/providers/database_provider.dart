import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DatabaseProvider extends ChangeNotifier {
  Map<String, Importance> conversionMap = {
    'Нет': Importance.none,
    'Низкий': Importance.low,
    '!! Высокий': Importance.high,
  };

  // final List<Task> _tasks = [];
  final Map<String, Task> _tasks = {};

  // List<Task> get tasks => _tasks;
  Map<String, Task> get tasks => _tasks;

  void saveTask(
    String text,
    String importance,
    DateTime? date,
  ) async {
    String id = const Uuid().v4();
    Task task = Task(
      id: id,
      text: text,
      importance: conversionMap[importance]!,
      doUntil: date,
      done: false,
    );
    // var db = await openDatabase('tasks.db');
    tasks[id] = task;
    print(task);
    notifyListeners();
  }

  void saveTaskById(
    String id,
    String text,
    String importance,
    DateTime? date,
  ) async {
    Task task = Task(
      id: id,
      text: text,
      importance: conversionMap[importance]!,
      doUntil: date,
      done: false,
    );
    tasks[id] = task;
    print(task);
    notifyListeners();
  }

  void deleteTask(String id) {
    tasks.remove(id);
  }

  void toggleDone(String id) {
    tasks[id]!.done = !tasks[id]!.done;
  }
}
