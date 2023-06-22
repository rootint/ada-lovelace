import 'dart:math';

import 'package:ada_lovelace/core/logger.dart';
import 'package:ada_lovelace/core/theme.dart';
import 'package:ada_lovelace/data-domain/providers/theme_provider.dart';
import 'package:ada_lovelace/presentation/screens/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data-domain/models/task.dart';
import '../../data-domain/providers/database_provider.dart';
import '../widgets/task_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isDoneVisible = true;
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = AppTheme.of(context);
    // if (_scrollController.hasClients) print(_scrollController.offset);
    return Scaffold(
      backgroundColor: theme.backPrimary,
      body: Consumer<DatabaseProvider>(
        builder: (context, value, child) {
          Map<String, Task> tasks = {};
          if (_isDoneVisible) {
            tasks = value.tasks;
          } else {
            for (var item in value.tasks.entries) {
              if (!item.value.done) {
                tasks[item.key] = item.value;
              }
            }
          }
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: TitleBar(
                    value: value.countDone(),
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
                                color: theme.backSecondary,
                              ),
                            ),
                          ),
                        );
                      }
                      if (index == tasks.length + 1) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: GestureDetector(
                            onTap: () {
                              Logger.addToLog('opened AddTaskScreen');
                              Navigator.of(context)
                                  .pushNamed(AddTaskScreen.routeName);
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
                                  padding: const EdgeInsets.only(
                                      left: 64, bottom: 12),
                                  child: Text(
                                    'Новое',
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
                      return TaskCard(task: tasks.values.toList()[index - 1]);
                    },
                    childCount: tasks.length + 2,
                  ),
                ),
              ],
            ),
          );
        },
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
}

class TitleBar extends SliverPersistentHeaderDelegate {
  TitleBar({
    required this.value,
    required this.onPressed,
    required this.isDoneVisible,
  });
  final int value;
  final Function onPressed;
  final bool isDoneVisible;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = AppTheme.of(context);
    return Material(
      elevation: min(4, shrinkOffset / 20),
      color: theme.backPrimary,
      child: Stack(
        children: [
          Positioned(
            left: 60 - min(44, shrinkOffset),
            bottom: 16 + max(0, 24 - shrinkOffset / 2),
            child: Text(
              'Мои дела',
              style: theme.largeTitle.copyWith(
                fontSize: max(20, 32 - shrinkOffset),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 60,
            bottom: 16,
            child: Opacity(
              opacity: 1 - min(1, shrinkOffset / 20),
              child: Text(
                'Выполнено — $value',
                style: theme.body.copyWith(color: theme.labelTertiary),
              ),
            ),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: () => onPressed(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  isDoneVisible ? Icons.visibility : Icons.visibility_off,
                  color: theme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 110;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
