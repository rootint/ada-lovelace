import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  final String id;
  final String text;
  final Importance importance;
  @JsonKey(name: 'deadline')
  int? doUntilTimestamp;
  bool done;
  @JsonKey(name: 'created_at')
  int createdAtTimestamp;
  @JsonKey(name: 'changed_at')
  int changedAtTimestamp;
  String? color;
  @JsonKey(name: 'last_updated_by')
  String lastUpdatedBy;

  Task({
    required this.id,
    this.doUntilTimestamp,
    required this.done,
    required this.importance,
    required this.text,
    required this.createdAtTimestamp,
    required this.changedAtTimestamp,
    this.color,
    required this.lastUpdatedBy,
  });

  Map<String, dynamic> toJson() => _$TaskToJson(this);
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

enum Importance { basic, low, important }
