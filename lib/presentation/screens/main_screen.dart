import 'package:ada_lovelace/core/theme.dart';
import 'package:ada_lovelace/presentation/screens/add_task_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backPrimary,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
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
                forceElevated: innerBoxIsScrolled,
              ),
            )
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 60, 8, 8),
            decoration: BoxDecoration(
              color: AppColors.backElevated,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 100,
            // child: ListView.builder(
            //   shrinkWrap: true,
            //   itemBuilder: (context, index) {
            //     if (index == 0) {
            //       return Row(
            //         children: [
            //           Text(
            //             'Выполнено: 5',
            //             style: AppColors.body
            //                 .copyWith(color: AppColors.labelTertiary),
            //           ),
            //           const Spacer(),
            //           const Icon(
            //             Icons.visibility,
            //             color: AppColors.primary,
            //           ),
            //         ],
            //       );
            //     }
            //     return Text(index.toString());
            //   },
            //   itemCount: 10 + 1,
            // ),
          ),
        ),
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
