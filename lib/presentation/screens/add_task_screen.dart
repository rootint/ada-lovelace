import 'package:ada_lovelace/core/theme.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  static String routeName = "/add-task";
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.backPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.backPrimary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
            color: AppColors.labelPrimary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('СОХРАНИТЬ'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Что надо сделать...',
                ),
              ),
              const SizedBox(height: 24),
              Text('Важность'),
              
            ],
          ),
        ),
      ),
    );
  }
}
