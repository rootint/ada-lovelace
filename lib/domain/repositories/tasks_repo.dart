import 'package:ada_lovelace/data/network/dto/task_dto.dart';
import 'package:ada_lovelace/data/network/dto/tasks_list_dto.dart';
import 'package:ada_lovelace/domain/models/tasks_list.dart';
import 'package:flutter/foundation.dart';

import '../models/task.dart';
import '../models/task_response.dart';

abstract class TasksRepo extends ChangeNotifier {
  Future<List<Task>> getList();

  Future<TasksList> patchList(final TasksListDto dto);

  Future<TaskResponse> getTaskById(final String id);
  
  Future<TasksList> postTask(final TaskDto dto);

  Future<TaskResponse> updateTask(final String id, final TaskDto dto);

  Future<TaskResponse> deleteTask(final String id);
}
