import 'package:ada_lovelace/core/theme.dart';
import 'package:ada_lovelace/presentation/screens/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data-domain/models/task.dart';
import '../../data-domain/providers/database_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backPrimary,
      body: Consumer<DatabaseProvider>(
        builder: (context, value, child) {
          // return NestedScrollView(
          //   headerSliverBuilder: (context, innerBoxIsScrolled) {
          //     return [
          //       SliverOverlapAbsorber(
          //         handle:
          //             NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          //         sliver: SliverAppBar(
          //           pinned: true,
          //           snap: false,
          //           floating: false,
          //           expandedHeight: 140.0,
          //           backgroundColor: AppColors.backPrimary,
          //           flexibleSpace: FlexibleSpaceBar(
          //             title: Text(
          //               'Мои дела',
          //               style: AppColors.largeTitle,
          //             ),
          //           ),
          //           forceElevated: innerBoxIsScrolled,
          //         ),
          //       )
          //     ];
          //   },
          //   body: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 8),
          //     child: Container(
          //       padding: const EdgeInsets.fromLTRB(8, 60, 8, 8),
          //       decoration: BoxDecoration(
          //         color: AppColors.backElevated,
          //         borderRadius: BorderRadius.circular(8),
          //       ),
          //       height: 100,
          //       child: ListView.builder(
          //         shrinkWrap: true,
          //         itemBuilder: (context, index) {
          //           if (index == 0) {
          //             return Row(
          //               children: [
          //                 Text(
          //                   'Выполнено: 5',
          //                   style: AppColors.body
          //                       .copyWith(color: AppColors.labelTertiary),
          //                 ),
          //                 const Spacer(),
          //                 const Icon(
          //                   Icons.visibility,
          //                   color: AppColors.primary,
          //                 ),
          //               ],
          //             );
          //           }
          //           return InkWell(
          //             // behavior: HitTestBehavior.translucent,
          //             onTap: () {
          //               Navigator.of(context).pushNamed(
          //                 AddTaskScreen.routeName,
          //                 arguments: value.tasks[index - 1].id,
          //               );
          //             },
          //             child: TaskCard(task: value.tasks[index - 1]),
          //           );
          //         },
          //         itemCount: value.tasks.length + 1,
          //       ),
          //     ),
          //   ),
          // );
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 140.0,
                backgroundColor: AppColors.backPrimary,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'Мои дела',
                    style: AppColors.largeTitle,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Text(
                      'Выполнено: 5',
                      style: AppColors.body
                          .copyWith(color: AppColors.labelTertiary),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.visibility,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return InkWell(
                      // behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AddTaskScreen.routeName,
                          arguments: value.tasks[index].id,
                        );
                      },
                      child: TaskCard(task: value.tasks[index]),
                    );
                    // },
                  },
                  childCount: value.tasks.length,
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

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (_) {}),
          const SizedBox(width: 16),
          Expanded(
            child: Text(task.text),
          ),
          const SizedBox(width: 16),
          Icon(Icons.info_outline),
        ],
      ),
    );
  }
}
