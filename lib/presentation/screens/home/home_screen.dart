import 'package:ada_lovelace/core/logger.dart';
import 'package:ada_lovelace/core/theme.dart';
import 'package:ada_lovelace/core/providers/theme_provider.dart';
import 'package:ada_lovelace/presentation/screens/add_task/add_task_screen.dart';
import 'package:ada_lovelace/presentation/screens/home/widgets/title_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/tasks/tasks_bloc.dart';
import '../../widgets/task_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isDoneVisible = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = AppTheme.of(context);
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state is TasksInitial) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        if (state is TasksLoaded) {
          final tasks = state.list;
          int done = 0;
          for (var item in tasks) {
            if (item.done) {
              done += 1;
            }
          }
          return Scaffold(
            backgroundColor: theme.backPrimary,
            body: SafeArea(
              bottom: false,
              child: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: TitleBar(
                      value: done,
                      isDoneVisible: _isDoneVisible,
                      onPressed: () {
                        setState(() {
                          Logger.addToLog('toggled done visibility');
                          _isDoneVisible = !_isDoneVisible;
                        });
                      },
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index == 0) {
                          return const ListTopPaddingWidget();
                        }
                        if (index == tasks.length + 1) {
                          return const ListBottomPaddingWidget();
                        }
                        return TaskCard(task: tasks[index - 1]);
                      },
                      childCount: tasks.length + 2,
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(
              children: [
                const SizedBox(width: 32),
                FloatingActionButton(
                  heroTag: 'theme',
                  onPressed: () {
                    if (themeProvider.currentTheme == ThemeType.dark) {
                      Logger.addToLog('changed theme to light theme');
                      themeProvider.setTheme(ThemeType.light);
                    } else {
                      Logger.addToLog('changed theme to dark theme');
                      themeProvider.setTheme(ThemeType.dark);
                    }
                  },
                  backgroundColor: theme.backSecondary,
                  child: Icon(
                    themeProvider.currentTheme == null
                        ? Icons.auto_mode
                        : themeProvider.currentTheme == ThemeType.dark
                            ? Icons.nightlight_outlined
                            : Icons.sunny,
                    color: theme.primary,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  heroTag: 'add',
                  onPressed: () {
                    Logger.addToLog('opened AddTaskScreen');
                    Navigator.of(context).pushNamed(AddTaskScreen.routeName);
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          );
        }
        Logger.addToLog('unexpected state at HomeScreen: ${state.toString()}');
        return const Text('Error');
      },
    );
  }
}

class ListTopPaddingWidget extends StatelessWidget {
  const ListTopPaddingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Material(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        elevation: 1,
        child: Container(
          height: 8,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: AppTheme.of(context).backSecondary,
          ),
        ),
      ),
    );
  }
}

class ListBottomPaddingWidget extends StatelessWidget {
  const ListBottomPaddingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 32),
      child: GestureDetector(
        onTap: () {
          Logger.addToLog('opened AddTaskScreen');
          Navigator.of(context).pushNamed(AddTaskScreen.routeName);
        },
        child: Material(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          elevation: 1,
          color: theme.backSecondary,
          child: Container(
            height: 56,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 64, bottom: 12),
              child: Text(
                AppLocalizations.of(context)!.addNewText,
                style: theme.body.copyWith(
                  color: theme.labelTertiary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
