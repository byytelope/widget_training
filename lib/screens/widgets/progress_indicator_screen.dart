import "package:flutter/material.dart";

class ProgressIndicatorScreen extends StatelessWidget {
  const ProgressIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Progress Indicator")),
      body: const Center(child: Text("Progress Indicator Screen Content")),
    );
  }
}
