import "package:flutter/material.dart";

class LocalStorageScreen extends StatelessWidget {
  const LocalStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Storage")),
      body: const Center(child: Text("Local Storage Screen Content")),
    );
  }
}
