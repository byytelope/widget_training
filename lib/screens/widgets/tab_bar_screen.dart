import "package:flutter/material.dart";

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tab Bar")),
      body: const Center(child: Text("Tab Bar Screen Content")),
    );
  }
}
