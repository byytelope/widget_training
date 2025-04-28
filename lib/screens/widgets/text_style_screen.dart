import "package:flutter/material.dart";

class TextStyleScreen extends StatelessWidget {
  const TextStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text Style")),
      body: const Center(child: Text("Text Style Screen Content")),
    );
  }
}
