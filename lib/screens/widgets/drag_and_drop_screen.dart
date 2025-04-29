import "package:flutter/material.dart";

class DragAndDropScreen extends StatelessWidget {
  const DragAndDropScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(5, (index) => "Item $index");

    return Scaffold(
      appBar: AppBar(title: const Text("Drag and Drop")),
      body: ReorderableListView.builder(
        clipBehavior: Clip.antiAlias,
        proxyDecorator: (child, index, animation) {
          return Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: child,
          );
        },
        itemBuilder: (context, index) {
          return Card.filled(
            clipBehavior: Clip.antiAlias,
            key: ValueKey(index),
            child: ListTile(title: Text(items[index])),
          );
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
