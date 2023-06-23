// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as String,
      doUntilTimestamp: json['deadline'] as int?,
      done: json['done'] as bool,
      importance: $enumDecode(_$ImportanceEnumMap, json['importance']),
      text: json['text'] as String,
      createdAtTimestamp: json['created_at'] as int,
      changedAtTimestamp: json['changed_at'] as int,
      color: json['color'] as String?,
      lastUpdatedBy: json['last_updated_by'] as String,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'importance': _$ImportanceEnumMap[instance.importance]!,
      'deadline': instance.doUntilTimestamp,
      'done': instance.done,
      'created_at': instance.createdAtTimestamp,
      'changed_at': instance.changedAtTimestamp,
      'color': instance.color,
      'last_updated_by': instance.lastUpdatedBy,
    };

const _$ImportanceEnumMap = {
  Importance.basic: 'basic',
  Importance.low: 'low',
  Importance.important: 'important',
};
