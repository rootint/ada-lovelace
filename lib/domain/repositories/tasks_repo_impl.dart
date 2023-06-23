import 'package:ada_lovelace/data/network/dto/task_dto.dart';
import 'package:ada_lovelace/data/network/dto/tasks_list_dto.dart';
import 'package:ada_lovelace/domain/models/task_response.dart';
import 'package:ada_lovelace/domain/models/tasks_list.dart';
import 'package:ada_lovelace/domain/repositories/tasks_repo.dart';

import '../../data/network/api/tasks_api.dart';

class TasksRepoImpl extends TasksRepo {
  final TasksApi api;
  TasksRepoImpl(this.api);

  @override
  Future<TaskResponse> deleteTask(String id) async {
    final response = await api.deleteTask(id);
    return response;
  }

  @override
  Future<TasksList> getList() async {
    final response = await api.getList();
    return response;
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
