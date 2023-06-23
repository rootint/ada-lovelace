import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/models/task.dart';
import '../../../domain/models/tasks_list.dart';
import '../../../domain/repositories/tasks_repo.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TasksRepo repo;
  TasksBloc(this.repo) : super(TasksInitial()) {
    on<GetTasksListEvent>(_getTasksListHandler);
    on<AddTaskEvent>(_addTaskHandler);
    on<DeleteTaskEvent>(_deleteTaskHandler);
    on<UpdateTaskEvent>(_updateTaskHandler);
  }

  Future<void> _getTasksListHandler(
      GetTasksListEvent event, Emitter<TasksState> emit) async {
    final response = await repo.getList();
    emit(TasksLoaded(response));
  }

  Future<void> _addTaskHandler(
      AddTaskEvent event, Emitter<TasksState> emit) async {}

  Future<void> _deleteTaskHandler(
      DeleteTaskEvent event, Emitter<TasksState> emit) async {}

  Future<void> _updateTaskHandler(
      UpdateTaskEvent event, Emitter<TasksState> emit) async {}
}
