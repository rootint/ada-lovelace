import 'package:ada_lovelace/domain/models/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tasks_list.g.dart';

@JsonSerializable()
class TasksList {
  final String status;
  @JsonKey(name: 'list')
  final List<Task> tasks;
  final int revision;

  TasksList({
    required this.status,
    required this.tasks,
    required this.revision,
  });

  Map<String, dynamic> toJson() => _$TasksListToJson(this);
  factory TasksList.fromJson(Map<String, dynamic> json) => _$TasksListFromJson(json);
}
