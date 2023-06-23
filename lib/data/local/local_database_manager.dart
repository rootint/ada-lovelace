import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/models/isar/task_isar.dart';
import '../../domain/models/task.dart';

class LocalDatabaseManager {
  Isar? _isar;

  Future<Isar> get _isarGetter async {
    final appDir = await getApplicationDocumentsDirectory();

    _isar ??= await Isar.open(
      [TaskIsarSchema],
      directory: appDir.path,
    );
    return _isar!;
  }

  Future<void> saveList(List<Task> tasks) async {
    final isar = await _isarGetter;

    for (var task in tasks) {
      final isarTask = TaskIsar()
        ..changedAtTimestamp = task.changedAtTimestamp
        ..color = task.color
        ..createdAtTimestamp = task.createdAtTimestamp
        ..doUntilTimestamp = task.doUntilTimestamp
        ..done = task.done
        ..taskId = task.id
        ..importance = task.importance
        ..lastUpdatedBy = task.lastUpdatedBy
        ..text = task.text;
      isar.writeTxn(() async {
        isar.taskIsars.put(isarTask);
      });
    }
  }

  Future<List<Task>> getList() async {
    final isar = await _isarGetter;
    final items = await isar.taskIsars.where().findAll();
    return items.map(
      (item) => Task(
        id: item.taskId!,
        done: item.done!,
        importance: item.importance,
        text: item.text!,
        createdAtTimestamp: item.createdAtTimestamp!,
        changedAtTimestamp: item.changedAtTimestamp!,
        lastUpdatedBy: item.lastUpdatedBy!,
      ),
    ).toList();
  }
}
