import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class SlidableWidgetScreen extends StatelessWidget {
  const SlidableWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Slidable Widget")),
      body: Center(
        child: Card.filled(
          clipBehavior: Clip.antiAlias,
          child: Slidable(
            startActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {},
                  icon: Icons.phone_outlined,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                SlidableAction(
                  onPressed: (context) {},
                  icon: Icons.chat_bubble_outline,
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {},
                  icon: Icons.delete,
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              ],
            ),
            child: ListTile(
              title: Text("Mohamed Shadhaan"),
              subtitle: Text("0147072848"),
              leading: Icon(Icons.person_outlined),
            ),
          ),
        ),
      ),
    );
  }
}
