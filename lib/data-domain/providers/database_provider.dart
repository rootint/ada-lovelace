import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/task.dart';

class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider() {
    // for (int i = 0; i < 10; ++i) {
    //   _tasks[i.toString()] = Task(
    //     id: i.toString(),
    //     text: i.toString(),
    //     importance: Importance.none,
    //     doUntil: null,
    //     done: false,
    //   );
    // }
  }

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
    notifyListeners();
  }

  void deleteTask(String id) {
    tasks.remove(id);
    notifyListeners();
  }

  void toggleDone(String id) {
    tasks[id]!.done = !tasks[id]!.done;
    notifyListeners();
  }

  int countDone() {
    int res = 0;
    for (var item in tasks.values) {
      res += item.done ? 1 : 0;
    }
    return res;
  }
}
