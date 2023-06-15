import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../core/theme.dart';
import '../../data-domain/models/task.dart';
import '../../data-domain/providers/database_provider.dart';
import '../screens/add_task_screen.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<DatabaseProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Dismissible(
        key: Key(task.id),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            taskProvider.toggleDone(task.id);
            return false;
          }
          return true;
        },
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            taskProvider.deleteTask(task.id);
          }
          if (direction == DismissDirection.startToEnd) {
            print('i am still here');
            taskProvider.toggleDone(task.id);
          }
        },
        background: Container(
          color: AppColors.success,
          child: const Row(
            children: [
              SizedBox(width: 24),
              Icon(
                Icons.check,
                color: AppColors.white,
              ),
            ],
          ),
        ),
        secondaryBackground: Container(
          color: AppColors.error,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.delete,
                color: AppColors.white,
              ),
              SizedBox(width: 24),
            ],
          ),
        ),
        child: Material(
          elevation: 1,
          color: AppColors.backElevated,
          child: InkWell(
            onTap: () {
              taskProvider.toggleDone(task.id);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  Checkbox(
                    fillColor: MaterialStateProperty.all(
                      task.done
                          ? AppColors.success
                          : task.importance == Importance.high
                              ? AppColors.error
                              : AppColors.separator,
                    ),
                    value: task.done,
                    onChanged: (_) {
                      taskProvider.toggleDone(task.id);
                    },
                  ),
                  const SizedBox(width: 4),
                  if (task.importance == Importance.high)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        '!! ',
                        style: AppColors.title.copyWith(
                          color: AppColors.error,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  if (task.importance == Importance.low)
                    Icon(
                      Icons.arrow_downward,
                      color: AppColors.gray,
                      size: 20,
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.text,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppColors.body.copyWith(
                            color: task.done
                                ? AppColors.labelTertiary
                                : AppColors.labelPrimary,
                            decoration:
                                task.done ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        if (task.doUntil != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              DateFormat('d.MM.y').format(task.doUntil!),
                              style: AppColors.subhead.copyWith(
                                color: AppColors.labelTertiary,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AddTaskScreen.routeName,
                        arguments: task.id,
                      );
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.info_outline,
                        color: AppColors.labelTertiary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
