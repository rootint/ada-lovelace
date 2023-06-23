import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/logger.dart';
import '../../core/theme.dart';
import '../../domain/models/task.dart';
import '../bloc/tasks/tasks_bloc.dart';
import '../screens/add_task/add_task_screen.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state is TasksInitial) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is TasksLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Dismissible(
              key: Key(task.id),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.startToEnd) {
                  Logger.addToLog('task with ${task.id} is completed');
                  // taskProvider.toggleDone(task.id);
                  return false;
                }
                return true;
              },
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {
                  Logger.addToLog('task with ${task.id} is deleted');
                  // taskProvider.deleteTask(task.id);
                }
              },
              background: Container(
                color: theme.success,
                child: Row(
                  children: [
                    const SizedBox(width: 24),
                    Icon(
                      Icons.check,
                      color: theme.white,
                    ),
                  ],
                ),
              ),
              secondaryBackground: Container(
                color: theme.error,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.delete,
                      color: theme.white,
                    ),
                    const SizedBox(width: 24),
                  ],
                ),
              ),
              child: Material(
                elevation: 1,
                color: theme.backSecondary,
                child: InkWell(
                  onTap: () {
                    Logger.addToLog('task with ${task.id} is completed');
                    // taskProvider.toggleDone(task.id);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        Checkbox(
                          fillColor: MaterialStateProperty.all(
                            task.done
                                ? theme.success
                                : task.importance == Importance.important
                                    ? theme.error
                                    : theme.separator,
                          ),
                          value: task.done,
                          onChanged: (_) {
                            Logger.addToLog(
                                'completion of ${task.id} is toggled');
                            // taskProvider.toggleDone(task.id);
                          },
                        ),
                        const SizedBox(width: 4),
                        if (task.importance == Importance.important)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            // TODO: change this to an icon and fix the bottom padding
                            child: Text(
                              '!! ',
                              style: theme.title.copyWith(
                                color: theme.error,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        if (task.importance == Importance.low)
                          Icon(
                            Icons.arrow_downward,
                            color: theme.gray,
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
                                style: theme.body.copyWith(
                                  color: task.done
                                      ? theme.labelTertiary
                                      : theme.labelPrimary,
                                  decoration: task.done
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                              if (task.doUntilTimestamp != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    DateFormat('d.MM.y').format(DateTime.fromMillisecondsSinceEpoch(task.doUntilTimestamp!)),
                                    style: theme.subhead.copyWith(
                                      color: theme.labelTertiary,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            Logger.addToLog(
                                'opened AddTaskScreen, arguments: ${task.id}');
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
                              color: theme.labelTertiary,
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
        Logger.addToLog('unexpected state at TaskCard: ${state.toString()}');
        return const Text('Error');
      },
    );
  }
}
