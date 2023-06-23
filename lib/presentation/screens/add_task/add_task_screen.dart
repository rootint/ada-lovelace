import 'package:ada_lovelace/core/theme.dart';
import 'package:ada_lovelace/domain/models/task.dart';
import 'package:ada_lovelace/core/providers/database_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/logger.dart';

class AddTaskScreen extends StatefulWidget {
  static String routeName = "/add-task";
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _controller = TextEditingController();
  String? _dropdownValue;
  bool _isDateSelected = false;
  DateTime? _date;
  bool firstBuild = true;

  void saveTask(String? id, Map<Importance, String> importanceMap) {
    // final taskProvider = Provider.of<DatabaseProvider>(context, listen: false);
    // late final Importance importance;
    // for (var item in importanceMap.keys) {
    //   if (importanceMap[item] == _dropdownValue) {
    //     importance = item;
    //     break;
    //   }
    // }
    // if (id == null) {
    //   taskProvider.saveTask(_controller.text, importance, _date);
    //   Logger.addToLog(
    //       'saving task with ${_controller.text}, $_dropdownValue, $_date');
    // } else {
    //   taskProvider.saveTaskById(id, _controller.text, importance, _date);
    //   Logger.addToLog('saving task with id $id');
    // }
  }

  // TODO: fix theming in the DatePicker
  void setDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2300),
    );
    setState(() {
      Logger.addToLog('picked date: $date');
      _date = date;
      if (date != null) {
        _isDateSelected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final databaseProvider =
    //     Provider.of<DatabaseProvider>(context, listen: false);
    final theme = AppTheme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final id = ModalRoute.of(context)!.settings.arguments as String?;
    final Map<Importance, String> importanceMap = {
      Importance.basic: l10n.importanceNone,
      Importance.low: l10n.importanceLow,
      Importance.important: l10n.importanceHigh,
    };
    // if (firstBuild && id != null) {
    //   Task task = databaseProvider.tasks[id]!;
    //   Logger.addToLog('initial build of AddTaskScreen');
    //   setState(() {
    //     _controller.text = task.text;
    //     _date = task.doUntil;
    //     _isDateSelected = _date != null;
    //     _dropdownValue = importanceMap[task.importance]!;
    //   });
    //   firstBuild = false;
    // } else if (firstBuild) {
    //   setState(() {
    //     _dropdownValue = importanceMap.values.first;
    //   });
    // }
    return Scaffold(
      backgroundColor: theme.backPrimary,
      appBar: AppBar(
        backgroundColor: theme.backPrimary,
        elevation: 0,
        scrolledUnderElevation: 4,
        leading: IconButton(
          onPressed: () {
            Logger.addToLog('exited AddTaskScreen');
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            color: theme.labelPrimary,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: _controller.text.isEmpty
                  ? null
                  : () {
                      saveTask(id, importanceMap);
                      Logger.addToLog(
                          'exited AddTaskScreen, saved task with id: $id');
                      Navigator.of(context).pop();
                    },
              child: Text(
                l10n.saveTask,
                style: theme.button.copyWith(
                  color: _controller.text.isEmpty
                      ? theme.labelDisabled
                      : theme.primary,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: theme.backSecondary,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration.collapsed(
                      hintText: l10n.taskTextPlaceholder,
                      hintStyle: theme.body.copyWith(
                        color: theme.labelTertiary,
                      ),
                    ),
                    style: theme.body.copyWith(color: theme.labelPrimary),
                    onChanged: (_) => setState(() {}),
                    minLines: 4,
                    maxLines: null,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                l10n.importance,
                style: theme.body,
              ),
              // TODO: change to PopupMenuButton
              DropdownButton<String>(
                icon: null,
                dropdownColor: theme.backElevated,
                items: importanceMap.values.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: value == l10n.importanceNone
                          ? Text(
                              value,
                              style: theme.subhead.copyWith(
                                color: theme.labelTertiary,
                              ),
                            )
                          : value == l10n.importanceLow
                              ? Text(value, style: theme.subhead)
                              : Text(
                                  value,
                                  style: theme.subhead
                                      .copyWith(color: theme.error),
                                ),
                    );
                  },
                ).toList(),
                iconSize: 0,
                underline: const SizedBox.shrink(),
                value: _dropdownValue,
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    Logger.addToLog('selected _dropdownValue: $value');
                    _dropdownValue = value!;
                  });
                },
                isDense: true,
                padding: const EdgeInsets.only(top: 4, bottom: 16),
              ),
              const Separator(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.doUntil,
                        style: theme.body,
                      ),
                      if (_isDateSelected && _date != null)
                        InkWell(
                          onTap: setDate,
                          child: Text(
                            DateFormat('d.MM.y').format(_date!),
                            style: theme.subhead.copyWith(color: theme.primary),
                          ),
                        ),
                    ],
                  ),
                  Switch(
                    value: _isDateSelected,
                    onChanged: (value) {
                      if (value) {
                        setDate();
                      } else {
                        setState(() {
                          _date = null;
                          _isDateSelected = value;
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Separator(),
              const SizedBox(height: 20),
              InkWell(
                onTap: id == null
                    ? null
                    : () {
                        Logger.addToLog('task with $id is deleted');
                        // databaseProvider.deleteTask(id);
                        Logger.addToLog('exited AddTaskScreen');
                        Navigator.of(context).pop();
                      },
                highlightColor: theme.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.delete,
                        color: id == null ? theme.labelDisabled : theme.error,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        l10n.deleteTask,
                        style: theme.body.copyWith(
                          color: id == null ? theme.labelDisabled : theme.error,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.of(context).separator,
      width: double.infinity,
      height: 0.5,
    );
  }
}
