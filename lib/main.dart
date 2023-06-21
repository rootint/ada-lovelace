import 'package:ada_lovelace/core/theme.dart';
import 'package:ada_lovelace/data-domain/providers/theme_provider.dart';
import 'package:ada_lovelace/presentation/screens/add_task_screen.dart';
import 'package:ada_lovelace/presentation/screens/main_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data-domain/providers/database_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<DatabaseProvider>(
            create: (_) => DatabaseProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, provider, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TODO',
          // themeMode: ThemeMode.system,
          themeMode: provider.currentTheme == null
              ? ThemeMode.system
              : provider.currentTheme == ThemeType.dark
                  ? ThemeMode.dark
                  : ThemeMode.light,
          theme: appThemeLight,
          darkTheme: appThemeDark,
          home: const MainScreen(),
          routes: <String, WidgetBuilder>{
            AddTaskScreen.routeName: (BuildContext context) =>
                const AddTaskScreen(),
          },
        ),
      ),
    );
  }
}
