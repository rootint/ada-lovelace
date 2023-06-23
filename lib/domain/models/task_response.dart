import 'package:ada_lovelace/domain/models/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_response.g.dart';

@JsonSerializable()
class TaskResponse {
  final String status;
  @JsonKey(name: 'element')
  final Task task;
  final int revision;

  TaskResponse({
    required this.status,
    required this.task,
    required this.revision,
  });

  Map<String, dynamic> toJson() => _$TaskResponseToJson(this);
  factory TaskResponse.fromJson(Map<String, dynamic> json) => _$TaskResponseFromJson(json);
}
