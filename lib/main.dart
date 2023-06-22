import 'package:ada_lovelace/core/theme.dart';
import 'package:ada_lovelace/core/providers/theme_provider.dart';
import 'package:ada_lovelace/presentation/screens/add_task/add_task_screen.dart';
import 'package:ada_lovelace/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'core/providers/database_provider.dart';

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
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateTitle: (context) =>
                AppLocalizations.of(context)!.appTitle,
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
