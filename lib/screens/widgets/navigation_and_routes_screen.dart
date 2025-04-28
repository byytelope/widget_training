import "package:flutter/material.dart";

class NavigationAndRoutesScreen extends StatelessWidget {
  const NavigationAndRoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigation & Routes")),
      body: const Center(child: Text("Navigation & Routes Screen Content")),
    );
  }
}
