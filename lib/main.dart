import "package:flutter/material.dart";
import "package:hive_ce_flutter/hive_flutter.dart";
import "package:provider/provider.dart";

import "package:widget_training/screens/home_screen.dart";
import "package:widget_training/services/theme_provider.dart";

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("mybox");

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final seedColor = Colors.yellow;

    return MaterialApp(
      title: "Widget Training",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: seedColor)),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: context.watch<ThemeProvider>().themeMode,
      home: const HomeScreen(),
    );
  }
}
