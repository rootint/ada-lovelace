import 'package:ada_lovelace/core/theme.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backPrimary,
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
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 80.0,
                backgroundColor: AppColors.backPrimary,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(left: 60),
                  title: Row(
                    children: [
                      // const SizedBox(width: 16),
                      Text(
                        'Мои дела',
                        style: AppColors.largeTitle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // const Spacer(),
                    ],
                  ),
                ),
                // Text(
                //   'Мои дела',
                //   style: AppColors.largeTitle.copyWith(
                //     fontSize: 24,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                // bottom: PreferredSize(
                //   preferredSize: Size.fromHeight(20),
                //   child: Row(
                //     children: [
                //       const SizedBox(width: 60),
                //       Text(
                //         'Мои дела',
                //         style: AppColors.largeTitle.copyWith(
                //           fontSize: 32,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      const SizedBox(width: 60),
                      Text(
                        'Выполнено — ${value.countDone()}',
                        style: AppColors.body
                            .copyWith(color: AppColors.labelTertiary),
                      ),
                      const Spacer(),
                      InkWell(
                        borderRadius: BorderRadius.circular(32),
                        onTap: () {
                          setState(() {
                            _isDoneVisible = !_isDoneVisible;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            _isDoneVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
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
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              color: AppColors.backElevated,
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
                            Navigator.of(context)
                                .pushNamed(AddTaskScreen.routeName);
                          },
                          child: Material(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            elevation: 1,
                            color: AppColors.backElevated,
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
                                padding:
                                    const EdgeInsets.only(left: 64, bottom: 12),
                                child: Text(
                                  'Новое',
                                  style: AppColors.body.copyWith(
                                    color: AppColors.labelTertiary,
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddTaskScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
