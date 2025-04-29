import "package:flutter/material.dart";

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int _selectedIndex = 0;

  void _onDestinationSelected(int index) {
    Navigator.pop(context);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drawer")),
      body: Center(
        child: Column(
          spacing: 8.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Selected Page: ${_selectedIndex == 0 ? "Home" : "Settings"}"),
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back"),
            ),
          ],
        ),
      ),
      drawer: NavigationDrawer(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onDestinationSelected,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Screens",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.home_outlined),
            label: Text("Home"),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.settings_outlined),
            label: Text("Settings"),
          ),
        ],
      ),
    );
  }
}
