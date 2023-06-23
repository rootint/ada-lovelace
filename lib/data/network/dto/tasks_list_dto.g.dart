// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasksListDto _$TasksListDtoFromJson(Map<String, dynamic> json) => TasksListDto(
      tasks: (json['list'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TasksListDtoToJson(TasksListDto instance) =>
    <String, dynamic>{
      'list': instance.tasks,
    };
