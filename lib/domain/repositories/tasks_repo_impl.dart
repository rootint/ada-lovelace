import 'package:ada_lovelace/data/local/local_database_manager.dart';
import 'package:ada_lovelace/data/network/dto/task_dto.dart';
import 'package:ada_lovelace/data/network/dto/tasks_list_dto.dart';
import 'package:ada_lovelace/domain/models/task.dart';
import 'package:ada_lovelace/domain/models/task_response.dart';
import 'package:ada_lovelace/domain/models/tasks_list.dart';
import 'package:ada_lovelace/domain/repositories/tasks_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../data/network/api/tasks_api.dart';

class TasksRepoImpl extends TasksRepo {
  final TasksApi api;
  final LocalDatabaseManager dbManager;
  TasksRepoImpl(this.api, this.dbManager);

  @override
  Future<TaskResponse> deleteTask(String id) async {
    final response = await api.deleteTask(id);
    return response;
  }

  @override
  Future<List<Task>> getList() async {
    final response = await api.getList();
    await dbManager.saveList(response.tasks);
    // final response = await dbManager.getList();
    return response.tasks;
  }

  @override
  Future<TaskResponse> getTaskById(String id) async {
    final response = await api.getTaskById(id);
    return response;
  }

  @override
  Future<TasksList> patchList(TasksListDto dto) async {
    final response = await api.patchList(dto);
    return response;
  }

  @override
  Future<TasksList> postTask(TaskDto dto) async {
    final response = await api.postTask(dto);
    return response;
  }

  @override
  Future<TaskResponse> updateTask(String id, TaskDto dto) async {
    final response = await api.updateTask(id, dto);
    return response;
  }
}
