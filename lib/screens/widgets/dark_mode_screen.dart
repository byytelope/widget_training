import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:widget_training/services/theme_provider.dart";

class DarkModeScreen extends StatefulWidget {
  const DarkModeScreen({super.key});

  @override
  State<DarkModeScreen> createState() => _DarkModeScreenState();
}

class _DarkModeScreenState extends State<DarkModeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Dark Mode")),
      body: Center(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return RadioListTile<ThemeMode>(
              title: Text(ThemeMode.values[index].toString().split(".").last),
              value: ThemeMode.values[index],
              groupValue: themeProvider.themeMode,
              onChanged: (value) {
                setState(() {
                  themeProvider.themeMode = value!;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
