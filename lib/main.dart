import 'package:ada_lovelace/core/theme.dart';
import 'package:ada_lovelace/data-domain/providers/theme_provider.dart';
import 'package:ada_lovelace/presentation/screens/add_task_screen.dart';
import 'package:ada_lovelace/presentation/screens/main_screen.dart';
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
          themeMode: provider.currentTheme == ThemeType.dark
              ? ThemeMode.dark
              : ThemeMode.light,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: AppColorsLight.primary,
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: AppColorsLight.primary,
              onPrimary: AppColorsLight.white,
              secondary: AppColorsLight.primary,
              onSecondary: AppColorsLight.white,
              error: AppColorsLight.error,
              onError: AppColorsLight.white,
              background: AppColorsLight.backPrimary,
              onBackground: AppColorsLight.labelPrimary,
              surface: AppColorsLight.backSecondary,
              onSurface: AppColorsLight.labelPrimary,
              onPrimaryContainer: AppColorsLight.labelPrimary,
            ),
            fontFamily: 'Roboto',
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: AppColorsDark.primary,
            colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: AppColorsDark.primary,
              onPrimary: AppColorsDark.white,
              secondary: AppColorsDark.primary,
              onSecondary: AppColorsDark.white,
              error: AppColorsDark.error,
              onError: AppColorsDark.white,
              background: AppColorsDark.backPrimary,
              onBackground: AppColorsDark.labelPrimary,
              surface: AppColorsDark.backSecondary,
              onSurface: AppColorsDark.labelPrimary,
            ),
            fontFamily: 'Roboto',
          ),
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
