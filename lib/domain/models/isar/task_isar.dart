import 'package:isar/isar.dart';

import '../task.dart';

part 'task_isar.g.dart';

@Collection()
class TaskIsar {
  // Id id = Isar.autoIncrement;

  // String? login;
  // @Name("avatar_url")
  // String? avatarUrl;
  // String? bio;
  // String? name;

  Id id = Isar.autoIncrement;
  String? taskId;
  String? text;
  @enumerated
  Importance importance = Importance.basic;
  int? doUntilTimestamp;
  bool? done;
  int? createdAtTimestamp;
  int? changedAtTimestamp;
  String? color;
  String? lastUpdatedBy;
  
}