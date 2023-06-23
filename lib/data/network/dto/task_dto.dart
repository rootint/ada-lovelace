import 'package:json_annotation/json_annotation.dart';

import '../../../domain/models/task.dart';

part 'task_dto.g.dart';

@JsonSerializable()
class TaskDto {
  final Task element;

  TaskDto({
    required this.element
  });

  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);
  factory TaskDto.fromJson(Map<String, dynamic> json) => _$TaskDtoFromJson(json);
}

enum Importance { basic, low, important }
