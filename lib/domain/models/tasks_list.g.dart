// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasksList _$TasksListFromJson(Map<String, dynamic> json) => TasksList(
      status: json['status'] as String,
      tasks: (json['list'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      revision: json['revision'] as int,
    );

Map<String, dynamic> _$TasksListToJson(TasksList instance) => <String, dynamic>{
      'status': instance.status,
      'list': instance.tasks,
      'revision': instance.revision,
    };
