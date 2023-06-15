import 'package:ada_lovelace/core/theme.dart';
import 'package:ada_lovelace/data-domain/models/task.dart';
import 'package:ada_lovelace/data-domain/providers/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

const List<String> dropdownOptions = ['Нет', 'Низкий', '!! Высокий'];

class AddTaskScreen extends StatefulWidget {
  static String routeName = "/add-task";
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  Map<Importance, String> reverseConversionMap = {
    Importance.none: 'Нет',
    Importance.low: 'Низкий',
    Importance.high: '!! Высокий',
  };
  final _controller = TextEditingController();
  String _dropdownValue = dropdownOptions.first;
  bool _isDateSelected = false;
  DateTime? _date;
  bool firstBuild = true;

  @override
  void initState() {
    super.initState();
  }

  void saveTask(String? id) {
    final taskProvider = Provider.of<DatabaseProvider>(context, listen: false);
    if (id == null) {
      taskProvider.saveTask(_controller.text, _dropdownValue, _date);
    } else {
      taskProvider.saveTaskById(id, _controller.text, _dropdownValue, _date);
    }
  }

  @override
  Widget build(BuildContext context) {
    final databaseProvider =
        Provider.of<DatabaseProvider>(context, listen: false);
    final theme = AppTheme.of(context);
    final id = ModalRoute.of(context)!.settings.arguments as String?;
    if (firstBuild && id != null) {
      Task task = databaseProvider.tasks[id]!;
      setState(() {
        _controller.text = task.text;
        _date = task.doUntil;
        _isDateSelected = _date != null;
        _dropdownValue = reverseConversionMap[task.importance]!;
      });
      firstBuild = false;
    }
    return Scaffold(
      backgroundColor: theme.backPrimary,
      appBar: AppBar(
        backgroundColor: theme.backPrimary,
        elevation: 0,
        scrolledUnderElevation: 4,
        leading: IconButton(
          onPressed: () {
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
                      saveTask(id);
                      Navigator.of(context).pop();
                    },
              child: Text(
                'СОХРАНИТЬ',
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
                      hintText: 'Что надо сделать...',
                      hintStyle: theme.body.copyWith(
                        color: theme.labelTertiary,
                      ),
                    ),
                    style:
                        theme.body.copyWith(color: theme.labelPrimary),
                    onChanged: (_) => setState(() {}),
                    minLines: 4,
                    maxLines: null,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Важность',
                style: theme.body,
              ),
              DropdownButton<String>(
                icon: null,
                dropdownColor: theme.backElevated,
                items: dropdownOptions.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: value == "Нет"
                          ? Text(
                              value,
                              style: theme.subhead.copyWith(
                                color: theme.labelTertiary,
                              ),
                            )
                          : value == 'Низкий'
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
                        'Сделать до',
                        style: theme.body,
                      ),
                      if (_isDateSelected && _date != null)
                        Text(
                          DateFormat('d.MM.y').format(_date!),
                          style: theme.subhead
                              .copyWith(color: theme.primary),
                        ),
                    ],
                  ),
                  Switch(
                    value: _isDateSelected,
                    onChanged: (value) {
                      setState(() {
                        if (value) {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            // lastDate: DateTime(DateTime.now().year + 100),
                            lastDate: DateTime(2300),
                          ).then(
                            (value) => setState(() {
                              _date = value;
                              if (value != null) {
                                _isDateSelected = true;
                              }
                            }),
                          );
                        } else {
                          _date = null;
                          _isDateSelected = value;
                        }
                      });
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
                        databaseProvider.deleteTask(id);
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
                        color: id == null
                            ? theme.labelDisabled
                            : theme.error,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Удалить',
                        style: theme.body.copyWith(
                          color: id == null
                              ? theme.labelDisabled
                              : theme.error,
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
