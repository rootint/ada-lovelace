part of 'tasks_bloc.dart';

@immutable
abstract class TasksState {}

class TasksInitial extends TasksState {}

class TasksLoaded extends TasksState {
  final List<Task> list;

  TasksLoaded(this.list);
}
