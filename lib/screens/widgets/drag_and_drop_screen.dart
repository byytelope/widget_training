import "package:flutter/material.dart";

class DragAndDropScreen extends StatelessWidget {
  const DragAndDropScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(5, (index) => "Item $index");

    return Scaffold(
      appBar: AppBar(title: const Text("Drag and Drop")),
      body: ReorderableListView.builder(
        itemBuilder: (context, index) {
          return ListTile(key: ValueKey(index), title: Text(items[index]));
        },
        itemCount: items.length,
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) {
            newIndex--;
          }
          final item = items.removeAt(oldIndex);
          items.insert(newIndex, item);
        },
      ),
    );
  }
}
