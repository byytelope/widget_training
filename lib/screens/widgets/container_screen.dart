import "package:flutter/material.dart";

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Container")),
      body: const Center(child: Text("Container Screen Content")),
    );
  }
}
