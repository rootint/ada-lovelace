import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

Map<String, Importance> conversionMap = {
  'Нет': Importance.none,
  'Низкий': Importance.low,
  '!! Высокий': Importance.high,
};

class DatabaseProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void saveTask(
    String text,
    String importance,
    DateTime? date,
  ) async {
    Task task = Task(
      id: const Uuid().v4(),
      text: text,
      importance: conversionMap[importance]!,
      doUntil: date,
      done: false,
    );
    // var db = await openDatabase('tasks.db');
    tasks.add(task);
    print(task);
    notifyListeners();
  }

  // void loadTasksFromDatabase() {
  //   notifyListeners();
  // }
}
