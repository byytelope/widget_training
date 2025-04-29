import "package:flutter/material.dart";
import "package:hidden_drawer_menu/hidden_drawer_menu.dart";

class HiddenPageScreen extends StatelessWidget {
  const HiddenPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorAppBar: Theme.of(context).colorScheme.surface,
      elevationAppBar: 0,
      screens: [
        ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Hidden Drawer (First page)",
            colorLineSelected: Theme.of(context).colorScheme.primary,
            baseStyle: Theme.of(context).textTheme.titleMedium!,
            selectedStyle: Theme.of(context).textTheme.titleMedium!,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8.0,
                children: [
                  const Text("First page", style: TextStyle(fontSize: 24)),
                  FilledButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Back"),
                  ),
                ],
              ),
            ),
          ),
        ),
        ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Hidden Drawer (Second page)",
            colorLineSelected: Theme.of(context).colorScheme.primary,
            baseStyle: Theme.of(context).textTheme.titleMedium!,
            selectedStyle: Theme.of(context).textTheme.titleMedium!,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8.0,
                children: [
                  const Text("Second page", style: TextStyle(fontSize: 24)),
                  FilledButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Back"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      backgroundColorMenu: Theme.of(context).colorScheme.surfaceContainer,
    );
  }
}
