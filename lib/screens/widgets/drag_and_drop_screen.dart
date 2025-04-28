import "package:flutter/material.dart";

class DragAndDropScreen extends StatelessWidget {
  const DragAndDropScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drag and Drop")),
      body: const Center(child: Text("Drag and Drop Screen Content")),
    );
  }
}
