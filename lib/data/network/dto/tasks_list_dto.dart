import 'package:ada_lovelace/domain/models/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tasks_list_dto.g.dart';

@JsonSerializable()
class TasksListDto {
  @JsonKey(name: 'list')
  final List<Task> tasks;

  TasksListDto({
    required this.tasks,
  });

  Map<String, dynamic> toJson() => _$TasksListDtoToJson(this);
  factory TasksListDto.fromJson(Map<String, dynamic> json) => _$TasksListDtoFromJson(json);
}
