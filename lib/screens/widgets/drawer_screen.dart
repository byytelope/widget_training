import "package:flutter/material.dart";

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drawer")),
      body: const Center(child: Text("Drawer Screen Content")),
    );
  }
}
