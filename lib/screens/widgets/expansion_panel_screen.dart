import "package:flutter/material.dart";

class ExpansionPanelScreen extends StatelessWidget {
  const ExpansionPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expansion Panel")),
      body: const Center(child: Text("Expansion Panel Screen Content")),
    );
  }
}
