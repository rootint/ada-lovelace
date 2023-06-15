import 'package:ada_lovelace/core/theme.dart';
import 'package:ada_lovelace/presentation/screens/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                        'Выполнено: 5',
                        style: AppColors.body
                            .copyWith(color: AppColors.labelTertiary),
                      ),
                      const Spacer(),
                      InkWell(
                        borderRadius: BorderRadius.circular(32),
                        // padding: EdgeInsets.zero,
                        onTap: () {},
                        child: const Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: const Icon(
                            Icons.visibility,
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
                    if (index == value.tasks.length + 1) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                      );
                    }
                    return TaskCard(
                        task: value.tasks.values.toList()[index - 1]);
                  },
                  childCount: value.tasks.length + 2,
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
