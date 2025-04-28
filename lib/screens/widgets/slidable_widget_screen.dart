import "package:flutter/material.dart";

class SlidableWidgetScreen extends StatelessWidget {
  const SlidableWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Slidable Widget")),
      body: const Center(child: Text("Slidable Widget Screen Content")),
    );
  }
}
