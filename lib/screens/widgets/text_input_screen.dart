import "package:flutter/material.dart";

class TextInputScreen extends StatelessWidget {
  const TextInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text Input")),
      body: const Center(child: Text("Text Input Screen Content")),
    );
  }
}
