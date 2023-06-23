part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class GetTasksListEvent extends TasksEvent {}

class AddTaskEvent extends TasksEvent {
  final Task task;

  const AddTaskEvent(this.task);
}

class DeleteTaskEvent extends TasksEvent {
  final String id;

  const DeleteTaskEvent(this.id);
}

class UpdateTaskEvent extends TasksEvent {
  final String id;
  final Task task;

  const UpdateTaskEvent(this.id, this.task);
}
