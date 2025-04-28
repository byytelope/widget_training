import "package:flutter/material.dart";

class AlertBoxScreen extends StatelessWidget {
  const AlertBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alert Box")),
      body: const Center(child: Text("Alert Box Screen Content")),
    );
  }
}
